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
