#!/usr/bin/env bash
set -euo pipefail

# dnssec-lab bootstrapper (v2)
# Creates a consistent, runnable repo (BIND root+TLD, PowerDNS auth+GUI), plus CA download portal and DNSSEC tester.
# GUI credentials: admin/admin

LAB_DIR=${1:-"$HOME/dnssec-lab"}

mkdir -p "$LAB_DIR"
cd "$LAB_DIR"

mkdir -p \
  ca-server/cert-api \
  root-dns/{config,zones,keys,logs} \
  tld-dns/{config,zones,keys,logs} \
  gui/poweradmin \
  gui/dnssec-tester \
  scripts \
  logs \
  backup

cat > .env <<'EOF'
COMPOSE_PROJECT_NAME=dnssec-lab
TZ=Asia/Kolkata

# MariaDB for PowerDNS/PowerAdmin
MYSQL_ROOT_PASSWORD=changeMeRoot!
MYSQL_DATABASE=powerdns
MYSQL_USER=pdns
MYSQL_PASSWORD=changeMePdns!

# PowerDNS API
PDNS_API_KEY=changeMeApiKey!

# GUI credentials (requested)
GUI_ADMIN_USER=admin
GUI_ADMIN_PASS=admin

# PowerAdmin admin bootstrap (PowerAdmin reads PA_* vars)
PA_CREATE_ADMIN=true
PA_ADMIN_USERNAME=admin
PA_ADMIN_PASSWORD=admin
PA_ADMIN_EMAIL=admin@example.zx
PA_ADMIN_FULLNAME=Administrator
EOF

cat > .gitignore <<'EOF'
.env
**/keys/
**/*.private
**/*.key
**/*.jnl
**/*.signed
logs/
backup/
EOF

cat > REQUIREMENTS.md <<'EOF'
# DNSSec lab – requirement document

## Goal
Build an **air‑gapped** DNSSEC lab on Ubuntu using Docker Compose, with a DNS hierarchy (root → TLD → authoritative), sample zones/records, internal CA, GUI record management, GUI-based DNSSEC testing, and automated monthly key rollovers.

## Functional requirements
- DNS hierarchy:
  - Root zone "." served by BIND9.
  - TLD zone "zx." served by BIND9, delegated from root.
  - Authoritative zones "example.zx" and "test.zx" served by PowerDNS Authoritative (managed via PowerDNS API).
- DNSSEC:
  - All zones are DNSSEC-signed.
  - DS chain is maintained from root → zx → child zones.
  - Monthly ZSK rollover automated; KSK rollover periodic (configurable) with DS updates inside the lab.
- Records:
  - Zones include sample records for: ns, mail/MX + SPF/DMARC, web, file, db, app, monitor, backup, ldap SRV, vpn.
- Internal CA:
  - Step-CA runs inside Docker.
  - A web portal allows downloading root CA (and chain) for installing on other hosts.
- GUI:
  - PowerAdmin provides add/remove DNS records for PowerDNS zones.
  - DNSSEC tester GUI validates a given name/type against a chosen server and shows DNSSEC-related output.
  - GUI credentials for applicable UIs: admin/admin.
- Air-gapped:
  - No runtime dependency on Internet (images must be mirrored or preloaded).
- Container hardening:
  - Use least privilege: `no-new-privileges`, drop capabilities where practical, and avoid privileged containers.
- GitHub-ready:
  - Repo excludes secrets/keys; can be pushed to GitHub later.
EOF

cat > README.md <<'EOF'
# DNSSec lab (air‑gapped)

## One-click deployment
```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

## GUIs (admin/admin)
- PowerAdmin: http://localhost:8080
- CA portal: http://localhost:9443 (basic auth)
- DNSSEC tester: http://localhost:8082 (basic auth)

## DNS ports
- Root (BIND): 5300
- TLD zx (BIND): 5301
- PowerDNS auth: 5353

## Quick checks
```bash
dig @127.0.0.1 -p 5301 zx. SOA +dnssec

dig @127.0.0.1 -p 5353 www.example.zx A +dnssec
```
EOF

# -------------------------
# BIND configs (root)
# -------------------------
cat > root-dns/config/named.conf <<'EOF'
include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
EOF

cat > root-dns/config/named.conf.options <<'EOF'
options {
  directory "/var/cache/bind";
  recursion no;
  allow-recursion { none; };
  listen-on { any; };
  listen-on-v6 { none; };
  dnssec-validation no;
};
EOF

cat > root-dns/config/named.conf.local <<'EOF'
dnssec-policy "root-policy" {
  dnskey-ttl 3600;
  keys {
    ksk lifetime P180D algorithm ecdsa256;
    zsk lifetime P30D  algorithm ecdsa256;
  };
  signatures-refresh 5d;
  signatures-validity 14d;
  signatures-validity-dnskey 14d;
};

zone "." {
  type master;
  file "/etc/bind/zones/db.root";
  dnssec-policy "root-policy";
  inline-signing yes;
  key-directory "/etc/bind/keys";
  auto-dnssec maintain;
  allow-query { any; };
};
EOF

cat > root-dns/zones/db.root <<'EOF'
$TTL 86400
$ORIGIN .
@ IN SOA root-ns.lab. admin.lab. (
  2026021201 3600 1800 604800 86400 )
@ IN NS root-ns.lab.
root-ns.lab. IN A 172.20.0.20

; delegate zx.
zx. IN NS tld-ns.zx.
tld-ns.zx. IN A 172.20.0.21

; DS for zx will be managed by scripts/ds-sync.sh (marker below)
;__ZX_DS__
EOF

# -------------------------
# BIND configs (TLD zx)
# -------------------------
cat > tld-dns/config/named.conf <<'EOF'
include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
EOF

cat > tld-dns/config/named.conf.options <<'EOF'
options {
  directory "/var/cache/bind";
  recursion no;
  allow-recursion { none; };
  listen-on { any; };
  listen-on-v6 { none; };
  dnssec-validation no;
};
EOF

cat > tld-dns/config/named.conf.local <<'EOF'
dnssec-policy "tld-policy" {
  dnskey-ttl 3600;
  keys {
    ksk lifetime P180D algorithm ecdsa256;
    zsk lifetime P30D  algorithm ecdsa256;
  };
  signatures-refresh 5d;
  signatures-validity 14d;
  signatures-validity-dnskey 14d;
};

zone "zx" {
  type master;
  file "/etc/bind/zones/db.zx";
  dnssec-policy "tld-policy";
  inline-signing yes;
  key-directory "/etc/bind/keys";
  auto-dnssec maintain;
  allow-query { any; };
};
EOF

cat > tld-dns/zones/db.zx <<'EOF'
$TTL 86400
$ORIGIN zx.
@ IN SOA tld-ns.zx. admin.zx. (
  2026021201 3600 1800 604800 86400 )
@ IN NS tld-ns.zx.
tld-ns IN A 172.20.0.21

; delegate example.zx and test.zx to PowerDNS
example.zx. IN NS ns1.example.zx.
ns1.example.zx. IN A 172.20.0.51

test.zx. IN NS ns1.test.zx.
ns1.test.zx. IN A 172.20.0.51

; DS for children will be managed by scripts/ds-sync.sh
;__EXAMPLE_DS__
;__TEST_DS__
EOF

# -------------------------
# PowerDNS DB init schema
# -------------------------
cat > gui/poweradmin/init-pdns-schema.sql <<'EOF'
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
  KEY nametype_index (name,type)
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
EOF

# -------------------------
# Cert portal with basic auth
# -------------------------
cat > ca-server/cert-api/Dockerfile <<'EOF'
FROM python:3.12-alpine
RUN pip install --no-cache-dir flask==3.0.3
WORKDIR /app
COPY app.py /app/app.py
EXPOSE 9443
CMD ["python","/app/app.py"]
EOF

cat > ca-server/cert-api/app.py <<'EOF'
from flask import Flask, send_file, abort, request, Response
import os, base64

app = Flask(__name__)

ROOT = os.environ.get('ROOT_CA', '/certs/root_ca.crt')
CHAIN = os.environ.get('CHAIN_CA', '/certs/ca-chain.crt')
USER = os.environ.get('GUI_ADMIN_USER', 'admin')
PASS = os.environ.get('GUI_ADMIN_PASS', 'admin')

def auth_required():
    h = request.headers.get('Authorization','')
    if not h.startswith('Basic '):
        return False
    try:
        raw = base64.b64decode(h.split(' ',1)[1]).decode('utf-8')
        u,p = raw.split(':',1)
        return u==USER and p==PASS
    except Exception:
        return False

def challenge():
    return Response('Authentication required', 401, {'WWW-Authenticate':'Basic realm="DNSSec Lab"'})

@app.get('/')
def index():
    if not auth_required():
        return challenge()
    return "OK. Endpoints: /root-ca, /chain\n"

@app.get('/root-ca')
def root_ca():
    if not auth_required():
        return challenge()
    if not os.path.exists(ROOT):
        abort(404)
    return send_file(ROOT, as_attachment=True, download_name='dnsslab-root-ca.crt')

@app.get('/chain')
def chain():
    if not auth_required():
        return challenge()
    if not os.path.exists(CHAIN):
        abort(404)
    return send_file(CHAIN, as_attachment=True, download_name='dnsslab-ca-chain.crt')

@app.get('/health')
def health():
    return {"root_exists": os.path.exists(ROOT), "chain_exists": os.path.exists(CHAIN)}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9443)
EOF

# -------------------------
# DNSSEC tester with basic auth
# -------------------------
cat > gui/dnssec-tester/Dockerfile <<'EOF'
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 python3-flask bind9-dnsutils ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY app.py /app/app.py
EXPOSE 8082
CMD ["python3","/app/app.py"]
EOF

cat > gui/dnssec-tester/app.py <<'EOF'
from flask import Flask, request, Response
import subprocess, base64, os

app = Flask(__name__)

USER = os.environ.get('GUI_ADMIN_USER', 'admin')
PASS = os.environ.get('GUI_ADMIN_PASS', 'admin')

def auth_required():
    h = request.headers.get('Authorization','')
    if not h.startswith('Basic '):
        return False
    try:
        raw = base64.b64decode(h.split(' ',1)[1]).decode('utf-8')
        u,p = raw.split(':',1)
        return u==USER and p==PASS
    except Exception:
        return False

def challenge():
    return Response('Authentication required', 401, {'WWW-Authenticate':'Basic realm="DNSSec Lab"'})

HTML = """
<!doctype html>
<title>DNSSEC tester</title>
<h2>DNSSEC tester</h2>
<form method=get action=/check>
  <label>Name: <input name=name placeholder="www.example.zx" required></label><br>
  <label>Type: <input name=rrtype value=A></label><br>
  <label>Server (container name): <input name=server value="powerdns-auth" ></label><br>
  <label>Port: <input name=port value=53 ></label><br>
  <button type=submit>Run dig +dnssec</button>
</form>
<p>Examples: server=root-dns-server, tld-dns-server, powerdns-auth (inside docker network).</p>
"""

@app.get('/')
def index():
    if not auth_required():
        return challenge()
    return HTML

@app.get('/check')
def check():
    if not auth_required():
        return challenge()

    name = request.args.get('name','')
    rrtype = request.args.get('rrtype','A')
    server = request.args.get('server','powerdns-auth')
    port = request.args.get('port','53')

    dig = subprocess.run([
        'dig', f'@{server}', '-p', str(port), name, rrtype,
        '+dnssec', '+multiline', '+noall', '+answer', '+authority'
    ], capture_output=True, text=True)

    out = "dig output:\n" + dig.stdout
    if dig.stderr:
        out += "\n-- stderr --\n" + dig.stderr

    return f"<pre>{out}</pre>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)
EOF

# -------------------------
# docker-compose.yml
# -------------------------
cat > docker-compose.yml <<'EOF'
version: '3.8'

networks:
  dnssec_net:
    driver: bridge
    ipam:
      config:
        - subnet: 172.20.0.0/16

volumes:
  mysql_data:
  poweradmin_data:
  ca_data:
  ca_certs:

services:
  mysql:
    image: mariadb:10.11
    container_name: pdns-mysql
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.50
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_DATABASE=${MYSQL_DATABASE}
      - MYSQL_USER=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
    volumes:
      - mysql_data:/var/lib/mysql
      - ./gui/poweradmin/init-pdns-schema.sql:/docker-entrypoint-initdb.d/init.sql:ro
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 10
    security_opt:
      - no-new-privileges:true

  powerdns:
    image: powerdns/pdns-auth-48:latest
    container_name: powerdns-auth
    restart: unless-stopped
    depends_on:
      mysql:
        condition: service_healthy
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.51
    environment:
      - PDNS_AUTH_API_KEY=${PDNS_API_KEY}
    command:
      - --api=yes
      - --api-key=${PDNS_API_KEY}
      - --webserver=yes
      - --webserver-address=0.0.0.0
      - --webserver-port=8081
      - --webserver-allow-from=0.0.0.0/0
      - --launch=gmysql
      - --gmysql-host=pdns-mysql
      - --gmysql-user=${MYSQL_USER}
      - --gmysql-password=${MYSQL_PASSWORD}
      - --gmysql-dbname=${MYSQL_DATABASE}
      - --gmysql-dnssec=yes
      - --dnssec=yes
    ports:
      - "5353:53/udp"
      - "5353:53/tcp"
      - "8081:8081"
    security_opt:
      - no-new-privileges:true

  poweradmin:
    image: poweradmin/poweradmin:stable
    container_name: poweradmin-gui
    restart: unless-stopped
    depends_on:
      mysql:
        condition: service_healthy
      powerdns:
        condition: service_started
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.52
    environment:
      - DB_TYPE=mysql
      - DB_HOST=pdns-mysql
      - DB_PORT=3306
      - DB_USER=${MYSQL_USER}
      - DB_PASS=${MYSQL_PASSWORD}
      - DB_NAME=${MYSQL_DATABASE}
      - PA_CREATE_ADMIN=${PA_CREATE_ADMIN}
      - PA_ADMIN_USERNAME=${PA_ADMIN_USERNAME}
      - PA_ADMIN_PASSWORD=${PA_ADMIN_PASSWORD}
      - PA_ADMIN_EMAIL=${PA_ADMIN_EMAIL}
      - PA_ADMIN_FULLNAME=${PA_ADMIN_FULLNAME}
      - PA_PDNS_API_URL=http://powerdns-auth:8081
      - PA_PDNS_API_KEY=${PDNS_API_KEY}
      - TZ=${TZ}
    ports:
      - "8080:80"
    volumes:
      - poweradmin_data:/var/www/html
    security_opt:
      - no-new-privileges:true

  step-ca:
    image: smallstep/step-ca:latest
    container_name: internal-ca
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.10
    volumes:
      - ca_data:/home/step
      - ca_certs:/home/step/certs
    environment:
      - DOCKER_STEPCA_INIT_NAME=DNSSec Lab CA
      - DOCKER_STEPCA_INIT_DNS_NAMES=ca.internal.lab,localhost,172.20.0.10
      - DOCKER_STEPCA_INIT_ACME=true
    ports:
      - "9000:9000"
    security_opt:
      - no-new-privileges:true

  cert-api:
    build: ./ca-server/cert-api
    container_name: cert-api
    restart: unless-stopped
    depends_on:
      - step-ca
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.11
    environment:
      - GUI_ADMIN_USER=${GUI_ADMIN_USER}
      - GUI_ADMIN_PASS=${GUI_ADMIN_PASS}
    volumes:
      - ca_certs:/certs:ro
    ports:
      - "9443:9443"
    security_opt:
      - no-new-privileges:true

  root-dns:
    image: ubuntu/bind9:latest
    container_name: root-dns-server
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.20
    volumes:
      - ./root-dns/config:/etc/bind:ro
      - ./root-dns/zones:/etc/bind/zones
      - ./root-dns/keys:/etc/bind/keys
      - ./root-dns/logs:/var/log/named
    ports:
      - "5300:53/udp"
      - "5300:53/tcp"
    security_opt:
      - no-new-privileges:true

  tld-dns:
    image: ubuntu/bind9:latest
    container_name: tld-dns-server
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.21
    volumes:
      - ./tld-dns/config:/etc/bind:ro
      - ./tld-dns/zones:/etc/bind/zones
      - ./tld-dns/keys:/etc/bind/keys
      - ./tld-dns/logs:/var/log/named
    ports:
      - "5301:53/udp"
      - "5301:53/tcp"
    security_opt:
      - no-new-privileges:true

  dnssec-tester:
    build: ./gui/dnssec-tester
    container_name: dnssec-tester
    restart: unless-stopped
    networks:
      dnssec_net:
        ipv4_address: 172.20.0.53
    environment:
      - GUI_ADMIN_USER=${GUI_ADMIN_USER}
      - GUI_ADMIN_PASS=${GUI_ADMIN_PASS}
    ports:
      - "8082:8082"
    security_opt:
      - no-new-privileges:true
EOF

# -------------------------
# Scripts
# -------------------------
cat > scripts/deploy.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# Prereq: docker + docker compose available.

docker compose up -d --build

echo "Waiting for PowerDNS API to become reachable..."
for i in $(seq 1 90); do
  if curl -fsS -H "X-API-Key: $(grep '^PDNS_API_KEY=' .env | cut -d= -f2)" \
      http://127.0.0.1:8081/api/v1/servers/localhost >/dev/null 2>&1; then
    break
  fi
  sleep 2
  if [[ $i -eq 90 ]]; then
    echo "PowerDNS API not reachable. Check: docker logs powerdns-auth" >&2
    exit 1
  fi
done

python3 scripts/seed_powerdns.py
bash scripts/ds-sync.sh

echo "\nDeployed successfully."
echo "PowerAdmin: http://localhost:8080 (admin/admin)"
echo "CA portal: http://localhost:9443 (admin/admin)"
echo "DNSSEC tester: http://localhost:8082 (admin/admin)"
EOF
chmod +x scripts/deploy.sh

cat > scripts/seed_powerdns.py <<'EOF'
import os, requests
from pathlib import Path

API='http://127.0.0.1:8081/api/v1/servers/localhost'

def read_env(key):
    env = Path(__file__).resolve().parents[1]/'.env'
    for line in env.read_text().splitlines():
        if line.startswith(key+'='):
            return line.split('=',1)[1].strip()

KEY=os.environ.get('PDNS_API_KEY') or read_env('PDNS_API_KEY')
H={'X-API-Key': KEY}


def ensure_zone(name):
    zurl=f"{API}/zones/{name}."
    r=requests.get(zurl, headers=H)
    if r.status_code==200:
        return
    payload={"name": f"{name}.", "kind":"Native", "nameservers":[f"ns1.{name}."], "rrsets":[]}
    r=requests.post(f"{API}/zones", headers=H, json=payload)
    r.raise_for_status()


def add_rrset(zone, name, rtype, records, ttl=3600):
    rrset={
      "name": name if name.endswith('.') else name+'.',
      "type": rtype,
      "ttl": ttl,
      "changetype": "REPLACE",
      "records": [{"content": c, "disabled": False} for c in records]
    }
    r=requests.patch(f"{API}/zones/{zone}.", headers=H, json={"rrsets":[rrset]})
    r.raise_for_status()

for zone in ['example.zx','test.zx']:
    ensure_zone(zone)

# example.zx sample set
add_rrset('example.zx','example.zx','NS',["ns1.example.zx."])
add_rrset('example.zx','ns1.example.zx','A',["172.20.0.51"])  # PowerDNS container
add_rrset('example.zx','www.example.zx','A',["172.20.0.60"])
add_rrset('example.zx','mail.example.zx','A',["172.20.0.40"])
add_rrset('example.zx','example.zx','MX',["10 mail.example.zx."])
add_rrset('example.zx','example.zx','TXT',["\"v=spf1 mx -all\""])
add_rrset('example.zx','_dmarc.example.zx','TXT',["\"v=DMARC1; p=quarantine\""])
add_rrset('example.zx','files.example.zx','A',["172.20.0.50"])
add_rrset('example.zx','db.example.zx','A',["172.20.0.70"])
add_rrset('example.zx','app.example.zx','A',["172.20.0.80"])
add_rrset('example.zx','monitor.example.zx','A',["172.20.0.90"])
add_rrset('example.zx','backup.example.zx','A',["172.20.0.100"])
add_rrset('example.zx','ldap.example.zx','A',["172.20.0.110"])
add_rrset('example.zx','_ldap._tcp.example.zx','SRV',["0 0 389 ldap.example.zx."])
add_rrset('example.zx','vpn.example.zx','A',["172.20.0.120"])

# test.zx sample set
add_rrset('test.zx','test.zx','NS',["ns1.test.zx."])
add_rrset('test.zx','ns1.test.zx','A',["172.20.0.51"])  # PowerDNS container
add_rrset('test.zx','www.test.zx','A',["172.20.0.170"])
add_rrset('test.zx','mail.test.zx','A',["172.20.0.160"])
add_rrset('test.zx','test.zx','MX',["10 mail.test.zx."])

print('Seeded PowerDNS zones (example.zx, test.zx).')
EOF

cat > scripts/ds-sync.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# Helper: bump serial in a BIND-style zone file (YYYYMMDDNN)
bump_serial() {
  local zf="$1"
  local cur
  cur=$(grep -Eo '[0-9]{10}' "$zf" | head -n1)
  local ymd=${cur:0:8}
  local nn=${cur:8:2}
  local today
  today=$(date +%Y%m%d)
  if [[ "$today" == "$ymd" ]]; then
    nn=$(printf "%02d" $((10#$nn + 1)))
    echo "${today}${nn}"
  else
    echo "${today}01"
  fi
}

# 1) zx DS into root
ZX_KEY=$(docker exec tld-dns-server bash -lc 'ls -1 /etc/bind/keys/Kzx.+*.key 2>/dev/null | head -n1')
if [[ -n "${ZX_KEY}" ]]; then
  DS_LINE=$(docker exec tld-dns-server bash -lc "dnssec-dsfromkey -2 ${ZX_KEY} | head -n1")
  perl -0777 -i -pe "s/;__ZX_DS__.*/${DS_LINE}\n;__ZX_DS__/s" root-dns/zones/db.root
  NEW=$(bump_serial root-dns/zones/db.root)
  perl -i -pe "s/[0-9]{10}\s*3600\s*1800\s*604800/${NEW} 3600 1800 604800/" root-dns/zones/db.root || true
  docker exec root-dns-server rndc reload . || true
fi

# 2) child DS into zx (derived from PowerDNS)
get_pdns_ds() {
  local zone="$1"
  docker exec powerdns-auth bash -lc "pdnsutil show-zone ${zone} 2>/dev/null | awk '/^DS /{print \"${zone}. IN DS \"$2\" \"$3\" \"$4\" \"$5\"\"}' | head -n1" || true
}

EX_DS=$(get_pdns_ds example.zx)
TE_DS=$(get_pdns_ds test.zx)

if [[ -n "${EX_DS}" ]]; then
  perl -0777 -i -pe "s/;__EXAMPLE_DS__.*/${EX_DS}\n;__EXAMPLE_DS__/s" tld-dns/zones/db.zx
fi
if [[ -n "${TE_DS}" ]]; then
  perl -0777 -i -pe "s/;__TEST_DS__.*/${TE_DS}\n;__TEST_DS__/s" tld-dns/zones/db.zx
fi

if [[ -n "${EX_DS}${TE_DS}" ]]; then
  NEW=$(bump_serial tld-dns/zones/db.zx)
  perl -i -pe "s/[0-9]{10}\s*3600\s*1800\s*604800/${NEW} 3600 1800 604800/" tld-dns/zones/db.zx || true
  docker exec tld-dns-server rndc reload zx || true
fi

echo "DS sync complete"
EOF
chmod +x scripts/ds-sync.sh

cat > scripts/health-check.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

docker compose ps

echo "\nDNS checks:"
dig @127.0.0.1 -p 5300 . SOA +dnssec +short || true
dig @127.0.0.1 -p 5301 zx. SOA +dnssec +short || true
dig @127.0.0.1 -p 5353 www.example.zx A +dnssec +short || true
EOF
chmod +x scripts/health-check.sh

cat > scripts/monthly-rotate.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
# BIND dnssec-policy will handle scheduled rollovers; this script forces reload and then re-syncs DS into parents.
cd "$(dirname "$0")/.."
docker exec root-dns-server rndc reload . || true
docker exec tld-dns-server rndc reload zx || true
bash scripts/ds-sync.sh
EOF
chmod +x scripts/monthly-rotate.sh

cat > scripts/install-cron.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
# Monthly cron job (1st of each month at 02:10) to run monthly-rotate.sh.
cd "$(dirname "$0")/.."
LINE="10 2 1 * * bash $PWD/scripts/monthly-rotate.sh >> $PWD/logs/monthly-rotate.log 2>&1"
( crontab -l 2>/dev/null | grep -v monthly-rotate.sh; echo "$LINE" ) | crontab -
echo "Installed cron: $LINE"
EOF
chmod +x scripts/install-cron.sh

cat > DEPLOY-STEPS.md <<'EOF'
# Step-by-step deployment (using .sh)

## 0) Prerequisites (Ubuntu)
1. Install Docker Engine and Docker Compose plugin.
2. In an air-gapped lab, make sure images are available offline (mirror to a local registry or `docker save`/`docker load`).

## 1) Generate the lab repo
```bash
bash dnssec-lab-bootstrap.sh ~/dnssec-lab
cd ~/dnssec-lab
```

## 2) Set secrets (recommended)
Edit `.env` and change:
- `MYSQL_ROOT_PASSWORD`
- `MYSQL_PASSWORD`
- `PDNS_API_KEY`

GUI credentials are fixed to `admin/admin` per your request.

## 3) Deploy (one command)
```bash
./scripts/deploy.sh
```

## 4) Confirm services
```bash
./scripts/health-check.sh
```

## 5) Use the GUIs
- PowerAdmin: http://localhost:8080 (admin/admin)
- CA portal: http://localhost:9443 (admin/admin)
- DNSSEC tester: http://localhost:8082 (admin/admin)

## 6) Get CA certificates for other hosts
From another host that can reach this machine:
- Download root CA: `http://<docker-host-ip>:9443/root-ca`
- Download chain: `http://<docker-host-ip>:9443/chain`

Install on Ubuntu/Debian:
```bash
sudo cp dnsslab-root-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

## 7) Enable monthly automated rollover
```bash
./scripts/install-cron.sh
```

## 8) GitHub upload
```bash
git init
git add .
git commit -m "dnssec lab"
# add remote later when you have access
git remote add origin <repo-url>
git push -u origin main
```
EOF

echo "\nCreated repo at: $LAB_DIR"
echo "Next: cd $LAB_DIR && ./scripts/deploy.sh"
