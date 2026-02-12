#!/usr/bin/env bash
set -euo pipefail
# BIND dnssec-policy will handle scheduled rollovers; this script forces reload and then re-syncs DS into parents.
cd "$(dirname "$0")/.."
docker exec root-dns-server rndc reload . || true
docker exec tld-dns-server rndc reload zx || true
bash scripts/ds-sync.sh
