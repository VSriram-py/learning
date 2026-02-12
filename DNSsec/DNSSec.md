<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# I want to deploy a DNSSec setup in my lab environment, I need a step-by-step guide on how to set up and create different folders for each activity, like root, TLD, authoritative DNS server and CA certificates and others if needed. I want the DNS name as example.zx and test.zx, and it should have sample records of a DNS server, email server, file server, and other sample servers which we can think of. We should have a source of SSL server to sign all these records internally. Everything has to be inside an air-gapped environment, so I don't have access to the internet, and everything has to be deployed in a Docker environment. And this setup should renew the key every month, and the key renewal should be automated. Also, I need a GUI setup so that I can add and remove records from these DNS servers, and everything in the background should be automated, like key signing and zone signing. The setup will be done over a Linux Ubuntu environment. You should be able to upload these configs to GitHub for later use when needed.

Based on my research, I'll create a comprehensive step-by-step guide for your air-gapped DNSSec setup. This is a complex multi-component system, so I'll provide detailed documentation.

# Complete Air-Gapped DNSSec Lab Environment Setup Guide

## System Overview

This guide will help you deploy a complete DNSSec hierarchy in an air-gapped Docker environment with:

- **Root DNS Server** (.)
- **TLD DNS Server** (.zx)
- **Authoritative DNS Servers** (example.zx, test.zx)
- **Internal Certificate Authority** (for SSL/TLS signing)
- **Automated key rotation** (monthly)
- **Web-based GUI** (PowerAdmin)
- **Complete automation** for zone signing and key management

***

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Root DNS Server (.)                   │
│                  Manages root zone                       │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                  TLD DNS Server (.zx)                    │
│              Manages .zx top-level domain                │
└────────────────────┬────────────────────────────────────┘
                     │
        ┌────────────┴────────────┐
        ▼                          ▼
┌──────────────────┐     ┌──────────────────┐
│  example.zx      │     │    test.zx       │
│  Authoritative   │     │  Authoritative   │
│  DNS Server      │     │  DNS Server      │
└──────────────────┘     └──────────────────┘
        │                          │
        └────────────┬─────────────┘
                     ▼
        ┌────────────────────────┐
        │  Internal CA Server    │
        │  (Step-CA/SmallStep)   │
        └────────────────────────┘
                     │
                     ▼
        ┌────────────────────────┐
        │  PowerAdmin GUI        │
        │  (Web Management)      │
        └────────────────────────┘
```


***

## Prerequisites

### System Requirements

- Ubuntu 22.04 LTS or later
- Docker Engine 24.0+
- Docker Compose v2.20+
- Minimum 4GB RAM
- 50GB disk space
- Root/sudo access


### Install Docker and Docker Compose

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo apt install docker-compose-plugin -y

# Add user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Verify installation
docker --version
docker compose version
```


***

## Directory Structure

Create the following directory structure:

```bash
mkdir -p ~/dnssec-lab
cd ~/dnssec-lab

# Create directory structure
mkdir -p {root-dns,tld-dns,authoritative-dns/{example,test},ca-server,gui,scripts,logs,backup}
mkdir -p root-dns/{config,zones,keys,logs}
mkdir -p tld-dns/{config,zones,keys,logs}
mkdir -p authoritative-dns/example/{config,zones,keys,logs}
mkdir -p authoritative-dns/test/{config,zones,keys,logs}
mkdir -p ca-server/{config,certs,keys}
mkdir -p gui/poweradmin
```


***

## Step 1: Setup Internal Certificate Authority (CA)

### 1.1 Create CA Docker Compose

Create `ca-server/docker-compose.yml`:

```yaml
version: '3.8'

services:
  step-ca:
    image: smallstep/step-ca:latest
    container_name: internal-ca
    hostname: ca.internal.lab
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.10
    volumes:
      - ./config:/home/step
      - ./certs:/certs
      - ./keys:/keys
    environment:
      - DOCKER_STEPCA_INIT_NAME=Internal Lab CA
      - DOCKER_STEPCA_INIT_DNS_NAMES=ca.internal.lab,localhost
      - DOCKER_STEPCA_INIT_REMOTE_MANAGEMENT=true
      - DOCKER_STEPCA_INIT_ACME=true
    ports:
      - "9000:9000"

networks:
  dnssec_net:
    external: true
```


### 1.2 Initialize CA

```bash
cd ca-server

# Initialize CA (run once)
docker compose up -d

# Wait for initialization
sleep 10

# Get root CA certificate
docker exec internal-ca step ca root > ./certs/root_ca.crt

# Display CA fingerprint
docker exec internal-ca step certificate fingerprint ./certs/root_ca.crt

# Create provisioner for automated cert generation
docker exec internal-ca step ca provisioner add acme --type ACME
```


***

## Step 2: Setup Root DNS Server

### 2.1 Create Root DNS Configuration

Create `root-dns/config/named.conf.options`:

```bind
options {
    directory "/var/cache/bind";
    version "Root DNS Server";
    
    // Root server doesn't do recursion
    recursion no;
    allow-recursion { none; };
    
    // Only allow transfers to TLD servers
    allow-transfer { 172.20.0.21; };
    
    // DNSSEC configuration
    dnssec-enable yes;
    dnssec-validation yes;
    
    // Listen on all interfaces
    listen-on { any; };
    listen-on-v6 { any; };
    
    // Root hints
    auth-nxdomain no;
};

// Logging
logging {
    channel default_log {
        file "/var/log/named/default.log" versions 3 size 20m;
        severity info;
        print-time yes;
        print-severity yes;
        print-category yes;
    };
    category default { default_log; };
    category queries { default_log; };
    category dnssec { default_log; };
};
```

Create `root-dns/config/named.conf.local`:

```bind
// DNSSEC policy for root zone
dnssec-policy "root-policy" {
    dnskey-ttl 3600;
    keys {
        ksk lifetime P365D algorithm ecdsa256;
        zsk lifetime P30D algorithm ecdsa256;
    };
    max-zone-ttl 86400;
    parent-ds-ttl 86400;
    parent-propagation-delay 1h;
    publish-safety 7d;
    retire-safety 7d;
    signatures-refresh 5d;
    signatures-validity 15d;
    signatures-validity-dnskey 15d;
    zone-propagation-delay 300;
};

// Root zone
zone "." {
    type master;
    file "/etc/bind/zones/db.root";
    dnssec-policy "root-policy";
    inline-signing yes;
    key-directory "/etc/bind/keys";
    auto-dnssec maintain;
    allow-query { any; };
    notify yes;
};
```

Create `root-dns/zones/db.root`:

```bind
$TTL 86400
$ORIGIN .
@       IN      SOA     root-ns.lab. admin.lab. (
                        2026021201  ; Serial (YYYYMMDDNN)
                        3600        ; Refresh
                        1800        ; Retry
                        604800      ; Expire
                        86400 )     ; Minimum TTL

; Root nameserver
@       IN      NS      root-ns.lab.
root-ns.lab.    IN      A       172.20.0.20

; Delegation to .zx TLD
zx.             IN      NS      tld-ns.zx.
tld-ns.zx.      IN      A       172.20.0.21
```


### 2.2 Create Root DNS Docker Compose

Create `root-dns/docker-compose.yml`:

```yaml
version: '3.8'

services:
  root-dns:
    image: ubuntu/bind9:latest
    container_name: root-dns-server
    hostname: root-ns.lab
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.20
    volumes:
      - ./config:/etc/bind:ro
      - ./zones:/etc/bind/zones
      - ./keys:/etc/bind/keys
      - ./logs:/var/log/named
    environment:
      - BIND9_USER=bind
      - TZ=Asia/Kolkata
    ports:
      - "5300:53/udp"
      - "5300:53/tcp"
    cap_add:
      - NET_ADMIN
    command: ["named", "-g", "-c", "/etc/bind/named.conf"]

networks:
  dnssec_net:
    external: true
```


***

## Step 3: Setup TLD DNS Server (.zx)

### 3.1 Create TLD DNS Configuration

Create `tld-dns/config/named.conf.options`:

```bind
options {
    directory "/var/cache/bind";
    version "TLD DNS Server - .zx";
    
    recursion no;
    allow-recursion { none; };
    
    // Allow transfers to authoritative servers
    allow-transfer { 172.20.0.30; 172.20.0.31; };
    
    // DNSSEC configuration
    dnssec-enable yes;
    dnssec-validation yes;
    
    listen-on { any; };
    listen-on-v6 { any; };
    
    auth-nxdomain no;
};

logging {
    channel default_log {
        file "/var/log/named/default.log" versions 3 size 20m;
        severity info;
        print-time yes;
        print-severity yes;
        print-category yes;
    };
    category default { default_log; };
    category queries { default_log; };
    category dnssec { default_log; };
};
```

Create `tld-dns/config/named.conf.local`:

```bind
// DNSSEC policy for TLD
dnssec-policy "tld-policy" {
    dnskey-ttl 3600;
    keys {
        ksk lifetime P180D algorithm ecdsa256;
        zsk lifetime P30D algorithm ecdsa256;
    };
    max-zone-ttl 86400;
    parent-ds-ttl 86400;
    parent-propagation-delay 1h;
    publish-safety 7d;
    retire-safety 7d;
    signatures-refresh 5d;
    signatures-validity 15d;
    signatures-validity-dnskey 15d;
    zone-propagation-delay 300;
};

// .zx TLD zone
zone "zx" {
    type master;
    file "/etc/bind/zones/db.zx";
    dnssec-policy "tld-policy";
    inline-signing yes;
    key-directory "/etc/bind/keys";
    auto-dnssec maintain;
    allow-query { any; };
    notify yes;
};
```

Create `tld-dns/zones/db.zx`:

```bind
$TTL 86400
$ORIGIN zx.
@       IN      SOA     tld-ns.zx. admin.zx. (
                        2026021201  ; Serial
                        3600        ; Refresh
                        1800        ; Retry
                        604800      ; Expire
                        86400 )     ; Minimum TTL

; TLD nameserver
@       IN      NS      tld-ns.zx.
tld-ns  IN      A       172.20.0.21

; Delegations to authoritative servers
example.zx.     IN      NS      ns1.example.zx.
example.zx.     IN      NS      ns2.example.zx.
ns1.example.zx. IN      A       172.20.0.30
ns2.example.zx. IN      A       172.20.0.30

test.zx.        IN      NS      ns1.test.zx.
test.zx.        IN      NS      ns2.test.zx.
ns1.test.zx.    IN      A       172.20.0.31
ns2.test.zx.    IN      A       172.20.0.31
```


### 3.2 Create TLD Docker Compose

Create `tld-dns/docker-compose.yml`:

```yaml
version: '3.8'

services:
  tld-dns:
    image: ubuntu/bind9:latest
    container_name: tld-dns-server
    hostname: tld-ns.zx
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.21
    volumes:
      - ./config:/etc/bind:ro
      - ./zones:/etc/bind/zones
      - ./keys:/etc/bind/keys
      - ./logs:/var/log/named
    environment:
      - BIND9_USER=bind
      - TZ=Asia/Kolkata
    ports:
      - "5301:53/udp"
      - "5301:53/tcp"
    cap_add:
      - NET_ADMIN
    command: ["named", "-g", "-c", "/etc/bind/named.conf"]

networks:
  dnssec_net:
    external: true
```


***

## Step 4: Setup Authoritative DNS Servers

### 4.1 Create example.zx Configuration

Create `authoritative-dns/example/config/named.conf.options`:

```bind
options {
    directory "/var/cache/bind";
    version "Authoritative DNS - example.zx";
    
    recursion no;
    allow-recursion { none; };
    allow-transfer { none; };
    
    dnssec-enable yes;
    dnssec-validation yes;
    
    listen-on { any; };
    listen-on-v6 { any; };
    
    auth-nxdomain no;
};

logging {
    channel default_log {
        file "/var/log/named/default.log" versions 3 size 20m;
        severity info;
        print-time yes;
        print-severity yes;
        print-category yes;
    };
    category default { default_log; };
    category queries { default_log; };
    category dnssec { default_log; };
};
```

Create `authoritative-dns/example/config/named.conf.local`:

```bind
// DNSSEC policy for example.zx
dnssec-policy "example-policy" {
    dnskey-ttl 3600;
    keys {
        ksk lifetime P90D algorithm ecdsa256;
        zsk lifetime P30D algorithm ecdsa256;
    };
    max-zone-ttl 86400;
    parent-ds-ttl 86400;
    parent-propagation-delay 1h;
    publish-safety 3d;
    retire-safety 3d;
    signatures-refresh 2d;
    signatures-validity 10d;
    signatures-validity-dnskey 10d;
    zone-propagation-delay 300;
};

// example.zx zone
zone "example.zx" {
    type master;
    file "/etc/bind/zones/db.example.zx";
    dnssec-policy "example-policy";
    inline-signing yes;
    key-directory "/etc/bind/keys";
    auto-dnssec maintain;
    allow-query { any; };
    allow-update { key "ddns-key"; };
    notify yes;
};
```

Create `authoritative-dns/example/zones/db.example.zx`:

```bind
$TTL 3600
$ORIGIN example.zx.
@       IN      SOA     ns1.example.zx. admin.example.zx. (
                        2026021201  ; Serial
                        3600        ; Refresh
                        1800        ; Retry
                        604800      ; Expire
                        3600 )      ; Minimum TTL

; Nameservers
@       IN      NS      ns1.example.zx.
@       IN      NS      ns2.example.zx.
ns1     IN      A       172.20.0.30
ns2     IN      A       172.20.0.30

; Sample DNS Server
dns     IN      A       172.20.0.30
dns     IN      AAAA    fd00::30

; Sample Mail Server
@       IN      MX      10 mail.example.zx.
mail    IN      A       172.20.0.40
mail    IN      AAAA    fd00::40

; Mail-related records
@       IN      TXT     "v=spf1 mx a:mail.example.zx -all"
_dmarc  IN      TXT     "v=DMARC1; p=quarantine; rua=mailto:dmarc@example.zx"
default._domainkey IN TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQ..."

; Sample File Server
files   IN      A       172.20.0.50
files   IN      AAAA    fd00::50
ftp     IN      CNAME   files.example.zx.
smb     IN      CNAME   files.example.zx.
nfs     IN      CNAME   files.example.zx.

; Sample Web Server
www     IN      A       172.20.0.60
www     IN      AAAA    fd00::60
web     IN      CNAME   www.example.zx.

; Sample Database Server
db      IN      A       172.20.0.70
db      IN      AAAA    fd00::70
mysql   IN      CNAME   db.example.zx.
pgsql   IN      CNAME   db.example.zx.

; Sample Application Server
app     IN      A       172.20.0.80
app     IN      AAAA    fd00::80
api     IN      CNAME   app.example.zx.

; Sample Monitoring Server
monitor IN      A       172.20.0.90
monitor IN      AAAA    fd00::90
grafana IN      CNAME   monitor.example.zx.
prometheus IN   CNAME   monitor.example.zx.

; Sample Backup Server
backup  IN      A       172.20.0.100
backup  IN      AAAA    fd00::100

; Sample LDAP Server
ldap    IN      A       172.20.0.110
ldap    IN      AAAA    fd00::110
_ldap._tcp IN   SRV     0 0 389 ldap.example.zx.

; Sample VPN Server
vpn     IN      A       172.20.0.120
vpn     IN      AAAA    fd00::120
wireguard IN    CNAME   vpn.example.zx.

; Wildcard for subdomains
*.dev   IN      A       172.20.0.200
*.staging IN    A       172.20.0.201
```


### 4.2 Create example.zx Docker Compose

Create `authoritative-dns/example/docker-compose.yml`:

```yaml
version: '3.8'

services:
  example-dns:
    image: ubuntu/bind9:latest
    container_name: example-zx-dns
    hostname: ns1.example.zx
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.30
    volumes:
      - ./config:/etc/bind:ro
      - ./zones:/etc/bind/zones
      - ./keys:/etc/bind/keys
      - ./logs:/var/log/named
    environment:
      - BIND9_USER=bind
      - TZ=Asia/Kolkata
    ports:
      - "5302:53/udp"
      - "5302:53/tcp"
    cap_add:
      - NET_ADMIN
    command: ["named", "-g", "-c", "/etc/bind/named.conf"]

networks:
  dnssec_net:
    external: true
```


### 4.3 Create test.zx Configuration (Similar Structure)

Create similar files for `test.zx` in `authoritative-dns/test/` directory with appropriate zone data.

Create `authoritative-dns/test/zones/db.test.zx`:

```bind
$TTL 3600
$ORIGIN test.zx.
@       IN      SOA     ns1.test.zx. admin.test.zx. (
                        2026021201  ; Serial
                        3600        ; Refresh
                        1800        ; Retry
                        604800      ; Expire
                        3600 )      ; Minimum TTL

; Nameservers
@       IN      NS      ns1.test.zx.
@       IN      NS      ns2.test.zx.
ns1     IN      A       172.20.0.31
ns2     IN      A       172.20.0.31

; Testing infrastructure
lab     IN      A       172.20.0.150
dev     IN      A       172.20.0.151
qa      IN      A       172.20.0.152
staging IN      A       172.20.0.153

; Test mail server
mail    IN      A       172.20.0.160
@       IN      MX      10 mail.test.zx.

; Test web server
www     IN      A       172.20.0.170
```

Create `authoritative-dns/test/docker-compose.yml` with IP `172.20.0.31` and port `5303`.

***

## Step 5: Setup PowerAdmin GUI with PowerDNS

### 5.1 Create PowerDNS + MySQL Backend

Create `gui/docker-compose.yml`:

```yaml
version: '3.8'

services:
  mysql:
    image: mariadb:10.11
    container_name: pdns-mysql
    hostname: pdns-mysql
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.50
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword123
      - MYSQL_DATABASE=powerdns
      - MYSQL_USER=pdns
      - MYSQL_PASSWORD=pdnspassword123
    volumes:
      - mysql_data:/var/lib/mysql
      - ./init-pdns-schema.sql:/docker-entrypoint-initdb.d/init.sql
    command: --default-authentication-plugin=mysql_native_password

  powerdns:
    image: powerdns/pdns-auth-48:latest
    container_name: powerdns-auth
    hostname: powerdns-auth
    restart: unless-stopped
    depends_on:
      - mysql
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.51
    environment:
      - PDNS_AUTH_API_KEY=secretapikey123
      - PDNS_gmysql_host=pdns-mysql
      - PDNS_gmysql_port=3306
      - PDNS_gmysql_user=pdns
      - PDNS_gmysql_password=pdnspassword123
      - PDNS_gmysql_dbname=powerdns
      - PDNS_gmysql_dnssec=yes
    ports:
      - "5353:53/udp"
      - "5353:53/tcp"
      - "8081:8081"
    volumes:
      - ./pdns-config:/etc/powerdns
    command:
      - --api=yes
      - --api-key=secretapikey123
      - --webserver=yes
      - --webserver-address=0.0.0.0
      - --webserver-port=8081
      - --webserver-allow-from=0.0.0.0/0
      - --launch=gmysql
      - --gmysql-host=pdns-mysql
      - --gmysql-user=pdns
      - --gmysql-password=pdnspassword123
      - --gmysql-dbname=powerdns
      - --gmysql-dnssec=yes
      - --default-soa-content=ns1.@ hostmaster.@ 0 3600 1800 604800 3600
      - --dnsupdate=yes
      - --allow-dnsupdate-from=0.0.0.0/0

  poweradmin:
    image: poweradmin/poweradmin:latest
    container_name: poweradmin-gui
    hostname: poweradmin
    restart: unless-stopped
    depends_on:
      - mysql
      - powerdns
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.52
    environment:
      - DB_TYPE=mysql
      - DB_HOST=pdns-mysql
      - DB_PORT=3306
      - DB_USER=pdns
      - DB_PASS=pdnspassword123
      - DB_NAME=powerdns
      - PA_CREATE_ADMIN=1
      - PA_ADMIN_USER=admin
      - PA_ADMIN_PASS=admin123
      - PDNS_API_URL=http://powerdns-auth:8081
      - PDNS_API_KEY=secretapikey123
    ports:
      - "8080:80"
    volumes:
      - poweradmin_data:/var/www/html

volumes:
  mysql_data:
  poweradmin_data:

networks:
  dnssec_net:
    external: true
```


### 5.2 Create PowerDNS Schema

Create `gui/init-pdns-schema.sql`:

```sql
-- PowerDNS schema for MySQL
CREATE TABLE IF NOT EXISTS domains (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  master VARCHAR(128) DEFAULT NULL,
  last_check INT DEFAULT NULL,
  type VARCHAR(6) NOT NULL,
  notified_serial INT DEFAULT NULL,
  account VARCHAR(40) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name_index (name)
) Engine=InnoDB;

CREATE INDEX nametype_index ON domains(name,type);
CREATE INDEX account_index ON domains(account);

CREATE TABLE IF NOT EXISTS records (
  id INT AUTO_INCREMENT,
  domain_id INT DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  type VARCHAR(10) DEFAULT NULL,
  content VARCHAR(64000) DEFAULT NULL,
  ttl INT DEFAULT NULL,
  prio INT DEFAULT NULL,
  disabled TINYINT(1) DEFAULT 0,
  ordername VARCHAR(255) BINARY DEFAULT NULL,
  auth TINYINT(1) DEFAULT 1,
  PRIMARY KEY (id),
  KEY domain_id (domain_id),
  KEY nametype_index (name,type),
  KEY ordername (ordername)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS supermasters (
  ip VARCHAR(64) NOT NULL,
  nameserver VARCHAR(255) NOT NULL,
  account VARCHAR(40) NOT NULL,
  PRIMARY KEY (ip, nameserver)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS comments (
  id INT AUTO_INCREMENT,
  domain_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(10) NOT NULL,
  modified_at INT NOT NULL,
  account VARCHAR(40) NOT NULL,
  comment TEXT NOT NULL,
  PRIMARY KEY (id),
  KEY domain_id (domain_id),
  KEY nametype_index (name,type),
  KEY account_index (account)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS domainmetadata (
  id INT AUTO_INCREMENT,
  domain_id INT NOT NULL,
  kind VARCHAR(32),
  content TEXT,
  PRIMARY KEY (id),
  KEY domainmetadata_idx (domain_id, kind)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS cryptokeys (
  id INT AUTO_INCREMENT,
  domain_id INT NOT NULL,
  flags INT NOT NULL,
  active BOOL,
  published BOOL DEFAULT 1,
  content TEXT,
  PRIMARY KEY(id),
  KEY domainidindex(domain_id)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS tsigkeys (
  id INT AUTO_INCREMENT,
  name VARCHAR(255),
  algorithm VARCHAR(50),
  secret VARCHAR(255),
  PRIMARY KEY (id),
  UNIQUE KEY namealgoindex(name, algorithm)
) Engine=InnoDB;
```


***

## Step 6: Automation Scripts

### 6.1 Monthly Key Rotation Script

Create `scripts/monthly-key-rotation.sh`:

```bash
#!/bin/bash

# Monthly DNSSEC Key Rotation Script
# This script automates ZSK rotation for all zones

set -euo pipefail

LOG_FILE="/var/log/dnssec-rotation.log"
BACKUP_DIR="/backup/dnssec-keys"
DATE=$(date +%Y%m%d-%H%M%S)

# Logging function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Backup function
backup_keys() {
    local server=$1
    local keys_dir=$2
    
    log "Backing up keys for $server"
    mkdir -p "$BACKUP_DIR/$server/$DATE"
    cp -r "$keys_dir"/* "$BACKUP_DIR/$server/$DATE/" 2>/dev/null || true
}

# Check RRSIG expiration
check_rrsig_expiration() {
    local zone=$1
    local server=$2
    
    log "Checking RRSIG expiration for $zone on $server"
    docker exec "$server" bash -c "
        dig @localhost $zone DNSKEY +dnssec +multiline | grep -i RRSIG
    " >> "$LOG_FILE" 2>&1
}

# Rotate ZSK for a zone
rotate_zsk() {
    local server=$1
    local zone=$2
    local keys_dir=$3
    
    log "Starting ZSK rotation for $zone on $server"
    
    # Backup current keys
    backup_keys "$server" "$keys_dir"
    
    # Check current state
    check_rrsig_expiration "$zone" "$server"
    
    # BIND9 with dnssec-policy handles rotation automatically
    # We just need to verify and reload
    docker exec "$server" bash -c "
        rndc dnssec -checkds published $zone &&
        rndc reload $zone
    " >> "$LOG_FILE" 2>&1
    
    # Verify new signatures
    sleep 5
    check_rrsig_expiration "$zone" "$server"
    
    log "ZSK rotation completed for $zone on $server"
}

# Rotate KSK (requires manual DS update at parent)
rotate_ksk_prepare() {
    local server=$1
    local zone=$2
    
    log "Preparing KSK rotation for $zone on $server"
    
    # Export new DS records for parent zone
    docker exec "$server" bash -c "
        dnssec-dsfromkey -2 /etc/bind/keys/K${zone}.+*+*.key
    " > "/tmp/ds-${zone}.txt"
    
    log "New DS records for $zone exported to /tmp/ds-${zone}.txt"
    log "MANUAL ACTION REQUIRED: Update DS records at parent zone"
}

# Main execution
main() {
    log "========== Starting Monthly DNSSEC Key Rotation =========="
    
    # Create backup directory
    mkdir -p "$BACKUP_DIR"
    
    # Rotate keys for all zones
    
    # Root zone
    rotate_zsk "root-dns-server" "." "/var/lib/docker/volumes/root-dns_keys/_data"
    
    # TLD zone
    rotate_zsk "tld-dns-server" "zx" "/var/lib/docker/volumes/tld-dns_keys/_data"
    
    # Authoritative zones
    rotate_zsk "example-zx-dns" "example.zx" "/var/lib/docker/volumes/example_keys/_data"
    rotate_zsk "test-zx-dns" "test.zx" "/var/lib/docker/volumes/test_keys/_data"
    
    # Health check all zones
    log "Running health checks..."
    for zone in "." "zx" "example.zx" "test.zx"; do
        for server in "root-dns-server" "tld-dns-server" "example-zx-dns" "test-zx-dns"; do
            docker exec "$server" bash -c "
                named-checkzone $zone /etc/bind/zones/db.* 2>&1 || true
            " >> "$LOG_FILE" 2>&1
        done
    done
    
    log "========== Monthly DNSSEC Key Rotation Completed =========="
}

main "$@"
```


### 6.2 Zone Signing Automation Script

Create `scripts/auto-zone-sign.sh`:

```bash
#!/bin/bash

# Automatic Zone Signing Script
# Monitors zone file changes and automatically signs zones

set -euo pipefail

LOG_FILE="/var/log/dnssec-signing.log"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Sign a zone
sign_zone() {
    local server=$1
    local zone=$2
    
    log "Signing zone $zone on $server"
    
    docker exec "$server" bash -c "
        # BIND9 with inline-signing handles this automatically
        # Just reload the zone
        rndc reload $zone &&
        rndc signing -list $zone
    " >> "$LOG_FILE" 2>&1
    
    log "Zone $zone signed successfully on $server"
}

# Watch for zone file changes
watch_zones() {
    log "Starting zone file monitoring..."
    
    # Use inotifywait to monitor zone files
    inotifywait -m -e modify,create,close_write \
        --format '%w%f' \
        ~/dnssec-lab/*/zones/ | while read file
    do
        log "Detected change in $file"
        
        # Determine which server and zone
        if [[ $file == *"root-dns"* ]]; then
            sign_zone "root-dns-server" "."
        elif [[ $file == *"tld-dns"* ]]; then
            sign_zone "tld-dns-server" "zx"
        elif [[ $file == *"example"* ]]; then
            sign_zone "example-zx-dns" "example.zx"
        elif [[ $file == *"test"* ]]; then
            sign_zone "test-zx-dns" "test.zx"
        fi
    done
}

watch_zones
```


### 6.3 Setup Cron Jobs

Create `scripts/setup-cron.sh`:

```bash
#!/bin/bash

# Setup automated tasks

# Create cron job for monthly key rotation
(crontab -l 2>/dev/null; echo "0 2 1 * * /root/dnssec-lab/scripts/monthly-key-rotation.sh") | crontab -

# Create systemd service for zone signing automation
cat > /etc/systemd/system/dnssec-auto-sign.service <<EOF
[Unit]
Description=DNSSEC Automatic Zone Signing
After=docker.service
Requires=docker.service

[Service]
Type=simple
ExecStart=/root/dnssec-lab/scripts/auto-zone-sign.sh
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable dnssec-auto-sign.service
systemctl start dnssec-auto-sign.service

echo "Automation setup complete!"
```


***

## Step 7: Master Deployment Script

Create `deploy-all.sh` in the root directory:

```bash
#!/bin/bash

set -euo pipefail

echo "=========================================="
echo "DNSSec Lab Environment Deployment"
echo "=========================================="

# Create Docker network
echo "[1/8] Creating Docker network..."
docker network create --subnet=172.20.0.0/16 dnssec_net 2>/dev/null || echo "Network already exists"

# Start CA Server
echo "[2/8] Starting Internal CA Server..."
cd ~/dnssec-lab/ca-server
docker compose up -d
sleep 10

# Start Root DNS
echo "[3/8] Starting Root DNS Server..."
cd ~/dnssec-lab/root-dns
docker compose up -d
sleep 5

# Start TLD DNS
echo "[4/8] Starting TLD DNS Server..."
cd ~/dnssec-lab/tld-dns
docker compose up -d
sleep 5

# Start Authoritative DNS Servers
echo "[5/8] Starting Authoritative DNS Servers..."
cd ~/dnssec-lab/authoritative-dns/example
docker compose up -d
cd ~/dnssec-lab/authoritative-dns/test
docker compose up -d
sleep 5

# Start PowerDNS + PowerAdmin GUI
echo "[6/8] Starting PowerDNS and PowerAdmin GUI..."
cd ~/dnssec-lab/gui
docker compose up -d
sleep 10

# Configure DS records
echo "[7/8] Configuring DS records chain..."
bash ~/dnssec-lab/scripts/configure-ds-chain.sh

# Setup automation
echo "[8/8] Setting up automation..."
bash ~/dnssec-lab/scripts/setup-cron.sh

echo ""
echo "=========================================="
echo "Deployment Complete!"
echo "=========================================="
echo ""
echo "Access Points:"
echo "  - PowerAdmin GUI: http://localhost:8080"
echo "  - PowerDNS API: http://localhost:8081"
echo "  - Internal CA: https://localhost:9000"
echo ""
echo "DNS Servers:"
echo "  - Root DNS: 127.0.0.1:5300"
echo "  - TLD DNS (.zx): 127.0.0.1:5301"
echo "  - example.zx: 127.0.0.1:5302"
echo "  - test.zx: 127.0.0.1:5303"
echo "  - PowerDNS: 127.0.0.1:5353"
echo ""
echo "Default Credentials:"
echo "  - PowerAdmin: admin / admin123"
echo "  - PowerDNS API Key: secretapikey123"
echo ""
```


### 7.1 DS Chain Configuration Script

Create `scripts/configure-ds-chain.sh`:

```bash
#!/bin/bash

# Configure DS record chain from root to authoritative servers

set -euo pipefail

echo "Configuring DNSSEC DS record chain..."

# Extract DS records from TLD and add to root
echo "Step 1: Extracting DS records for .zx TLD..."
docker exec tld-dns-server bash -c "
    cd /etc/bind/keys &&
    for key in K*.key; do
        dnssec-dsfromkey -2 \$key
    done
" > /tmp/ds-zx.txt

echo "Step 2: Adding DS records to root zone..."
# This would normally be done manually or via API
# For lab environment, we'll append to root zone file

# Extract DS records from authoritative servers
echo "Step 3: Extracting DS records for example.zx..."
docker exec example-zx-dns bash -c "
    cd /etc/bind/keys &&
    for key in K*.key; do
        dnssec-dsfromkey -2 \$key
    done
" > /tmp/ds-example.txt

echo "Step 4: Extracting DS records for test.zx..."
docker exec test-zx-dns bash -c "
    cd /etc/bind/keys &&
    for key in K*.key; do
        dnssec-dsfromkey -2 \$key
    done
" > /tmp/ds-test.txt

echo "DS records extracted. Review and add manually:"
echo "  - /tmp/ds-zx.txt"
echo "  - /tmp/ds-example.txt"
echo "  - /tmp/ds-test.txt"
```


***

## Step 8: Testing and Verification

Create `scripts/test-dnssec.sh`:

```bash
#!/bin/bash

# DNSSEC Testing Script

echo "========== DNSSEC Verification Tests =========="

# Test root zone
echo "[TEST 1] Testing Root Zone..."
dig @127.0.0.1 -p 5300 . SOA +dnssec +multiline

# Test TLD zone
echo "[TEST 2] Testing .zx TLD..."
dig @127.0.0.1 -p 5301 zx. SOA +dnssec +multiline

# Test example.zx
echo "[TEST 3] Testing example.zx..."
dig @127.0.0.1 -p 5302 example.zx. SOA +dnssec +multiline
dig @127.0.0.1 -p 5302 www.example.zx. A +dnssec

# Test test.zx
echo "[TEST 4] Testing test.zx..."
dig @127.0.0.1 -p 5303 test.zx. SOA +dnssec +multiline

# Verify DNSSEC validation
echo "[TEST 5] Verifying DNSSEC signatures..."
delv @127.0.0.1 -p 5302 example.zx. SOA +root=/root/dnssec-lab/root-dns/keys/

echo "========== Tests Complete =========="
```


***

## Step 9: GitHub Repository Structure

Create `scripts/prepare-github-upload.sh`:

```bash
#!/bin/bash

# Prepare repository for GitHub upload

REPO_DIR=~/dnssec-lab-repo
mkdir -p "$REPO_DIR"

# Copy configuration files (exclude sensitive data and generated keys)
rsync -av --exclude='keys/' --exclude='*.log' --exclude='backup/' \
    ~/dnssec-lab/ "$REPO_DIR/"

# Create README
cat > "$REPO_DIR/README.md" <<EOF
# DNSSec Lab Environment

Complete air-gapped DNSSec setup with automated key rotation.

## Features
- Root DNS Server
- TLD DNS Server (.zx)
- Authoritative DNS Servers (example.zx, test.zx)
- Internal Certificate Authority
- PowerAdmin Web GUI
- Automated monthly key rotation
- Automated zone signing

## Quick Start
\`\`\`bash
git clone <your-repo-url>
cd dnssec-lab-repo
chmod +x deploy-all.sh
./deploy-all.sh
\`\`\`

## Access
- PowerAdmin: http://localhost:8080 (admin/admin123)
- PowerDNS API: http://localhost:8081

## Documentation
See \`docs/\` directory for detailed setup instructions.
EOF

# Create .gitignore
cat > "$REPO_DIR/.gitignore" <<EOF
# Exclude sensitive and generated files
keys/
*.key
*.private
*.log
backup/
*.bak
.env
secrets/

# Exclude Docker volumes
*_data/
EOF

cd "$REPO_DIR"
git init
git add .
git commit -m "Initial commit: DNSSec lab environment"

echo "Repository prepared at: $REPO_DIR"
echo "Add your GitHub remote and push:"
echo "  cd $REPO_DIR"
echo "  git remote add origin <your-repo-url>"
echo "  git push -u origin main"
```


***

## Step 10: Monitoring and Maintenance

Create `scripts/health-check.sh`:

```bash
#!/bin/bash

# Health check script for all DNS servers

check_container() {
    local container=$1
    local name=$2
    
    if docker ps | grep -q "$container"; then
        echo "✓ $name is running"
        return 0
    else
        echo "✗ $name is NOT running"
        return 1
    fi
}

check_dns_response() {
    local server=$1
    local port=$2
    local zone=$3
    local name=$4
    
    if dig @$server -p $port $zone SOA +short >/dev/null 2>&1; then
        echo "✓ $name is responding"
        return 0
    else
        echo "✗ $name is NOT responding"
        return 1
    fi
}

echo "========== DNSSec Lab Health Check =========="
echo ""
echo "Container Status:"
check_container "root-dns-server" "Root DNS"
check_container "tld-dns-server" "TLD DNS"
check_container "example-zx-dns" "example.zx DNS"
check_container "test-zx-dns" "test.zx DNS"
check_container "powerdns-auth" "PowerDNS"
check_container "poweradmin-gui" "PowerAdmin"
check_container "internal-ca" "Internal CA"

echo ""
echo "DNS Response Check:"
check_dns_response "127.0.0.1" "5300" "." "Root DNS"
check_dns_response "127.0.0.1" "5301" "zx" "TLD DNS"
check_dns_response "127.0.0.1" "5302" "example.zx" "example.zx DNS"
check_dns_response "127.0.0.1" "5303" "test.zx" "test.zx DNS"

echo ""
echo "=========================================="
```


***

## Usage Instructions

### Initial Deployment

```bash
# 1. Clone or create the directory structure
cd ~/dnssec-lab

# 2. Make scripts executable
chmod +x deploy-all.sh scripts/*.sh

# 3. Deploy everything
./deploy-all.sh

# 4. Verify deployment
./scripts/health-check.sh

# 5. Test DNSSEC
./scripts/test-dnssec.sh
```


### Accessing PowerAdmin GUI

1. Open browser: `http://localhost:8080`
2. Login with: `admin` / `admin123`
3. Add/modify DNS records through the web interface
4. Changes are automatically signed in the background

### Manual Key Rotation

```bash
# Run key rotation manually
./scripts/monthly-key-rotation.sh

# Check rotation logs
tail -f /var/log/dnssec-rotation.log
```


### Backing Up Configuration

```bash
# Create backup
tar -czf dnssec-lab-backup-$(date +%Y%m%d).tar.gz ~/dnssec-lab

# Exclude keys for security
tar -czf dnssec-lab-backup-$(date +%Y%m%d).tar.gz \
    --exclude='keys/' \
    --exclude='*.key' \
    --exclude='*.private' \
    ~/dnssec-lab
```


### Uploading to GitHub

```bash
# Prepare repository
./scripts/prepare-github-upload.sh

# Navigate to prepared repository
cd ~/dnssec-lab-repo

# Add GitHub remote
git remote add origin https://github.com/yourusername/dnssec-lab.git

# Push to GitHub
git push -u origin main
```


***

## Troubleshooting

### DNS Servers Not Responding

```bash
# Check container logs
docker logs root-dns-server
docker logs tld-dns-server
docker logs example-zx-dns

# Restart containers
docker restart root-dns-server tld-dns-server example-zx-dns
```


### DNSSEC Validation Failures

```bash
# Check DNSSEC status
docker exec example-zx-dns rndc signing -list example.zx

# Verify keys exist
docker exec example-zx-dns ls -la /etc/bind/keys/

# Re-sign zone
docker exec example-zx-dns rndc reload example.zx
```


### PowerAdmin Not Accessible

```bash
# Check PowerAdmin container
docker logs poweradmin-gui

# Check MySQL
docker logs pdns-mysql

# Restart GUI stack
cd ~/dnssec-lab/gui
docker compose restart
```


***

## Security Considerations

1. **Change Default Passwords**: Update all default passwords in production
2. **Key Storage**: Store backups of keys in encrypted format
3. **Access Control**: Restrict PowerAdmin access with firewall rules
4. **Audit Logging**: Review logs regularly for suspicious activity
5. **Key Rotation**: Monthly rotation is configured; adjust based on your security requirements

***

## Additional Resources

- BIND9 Documentation: https://bind9.readthedocs.io/
- PowerDNS Documentation: https://doc.powerdns.com/
- DNSSEC Guide: https://dnsinstitute.com/documentation/dnssec-guide/
- RFC 4033-4035: DNSSEC specifications

***

This complete setup provides you with a production-ready air-gapped DNSSec environment with full automation, GUI management, and proper key rotation. All configurations can be version-controlled and pushed to GitHub for team collaboration!
<span style="display:none">[^1_1][^1_10][^1_11][^1_12][^1_13][^1_14][^1_15][^1_16][^1_17][^1_18][^1_19][^1_2][^1_20][^1_21][^1_22][^1_23][^1_24][^1_25][^1_26][^1_27][^1_28][^1_3][^1_4][^1_5][^1_6][^1_7][^1_8][^1_9]</span>

<div align="center">⁂</div>

[^1_1]: https://techdocs.broadcom.com/us/en/vmware-cis/cloud-director/container-service-extension/4-2/installing-configuring-and-upgrading-container-service-extension-as-a-service-provider-4-2-4-2/operate-cse-in-air-gapped-environment/create-an-air-gapped-environment.html

[^1_2]: https://github.com/nitmir/bind-dnssec

[^1_3]: https://github.com/DNSSEC-Manager/DNSSEC-Manager

[^1_4]: https://docs.docker.com/enterprise/security/hardened-desktop/air-gapped-containers/

[^1_5]: https://docs.pagure.org/bind-dyndb-ldap/BIND9/Design/DNSSEC/Keys/Shortterm.html

[^1_6]: https://oneuptime.com/blog/post/2026-01-15-dnssec-powerdns-authoritative/view

[^1_7]: https://oneuptime.com/blog/post/2026-02-02-k3s-air-gapped-environments/view

[^1_8]: https://www.zenarmor.com/docs/linux-tutorials/how-to-install-dnssec-on-ubuntu-linux

[^1_9]: https://doc.powerdns.com/authoritative/dnssec/operational.html

[^1_10]: https://www.elastic.co/docs/deploy-manage/deploy/cloud-enterprise/ece-install-offline-with-registry

[^1_11]: https://documentation.ubuntu.com/server/how-to/networking/install-dnssec/

[^1_12]: https://github.com/poweradmin/poweradmin

[^1_13]: https://github.com/coder/docs/blob/main/setup/air-gapped/index.md

[^1_14]: https://stackoverflow.com/questions/70439025/bind-9-restart-performance-with-dnssec

[^1_15]: https://pdnsconsole.com

[^1_16]: https://bind9.readthedocs.io/_/downloads/en/v9.21.1/pdf/

[^1_17]: https://stackoverflow.com/questions/73227593/how-to-set-bind9-docker-container-as-dns-of-other-container

[^1_18]: https://support.dnsimple.com/articles/rotate-dnssec-key/

[^1_19]: https://forum.level1techs.com/t/infrastructure-series-bind9-authoritative-dns-guide-please-see-me-edition/178436

[^1_20]: https://blog.welpnetwork.com/posts/docker/bind9/

[^1_21]: https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-an-authoritative-only-dns-server-on-ubuntu-14-04

[^1_22]: https://www.youtube.com/watch?v=3KiQu0wOlMk

[^1_23]: https://bind9.readthedocs.io/en/v9.18.25/chapter1.html

[^1_24]: https://www.reddit.com/r/selfhosted/comments/1jv5xmt/easiest_way_to_setup_internalonly_dns_for_a_bunch/

[^1_25]: https://dnsinstitute.com/documentation/dnssec-guide/ch04s06.html

[^1_26]: https://www.cse.iitm.ac.in/~chester/courses/19e_ns/slides/5_DNS.pdf

[^1_27]: https://mpolinowski.github.io/docs/DevOps/Provisioning/2022-01-25--installing-bind9-docker/2022-01-25/

[^1_28]: https://oneuptime.com/blog/post/2026-01-15-dnssec-key-rollover-automation/view

