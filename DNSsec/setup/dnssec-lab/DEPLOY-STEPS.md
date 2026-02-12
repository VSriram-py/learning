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
