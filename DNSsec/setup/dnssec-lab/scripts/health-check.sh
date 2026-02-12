#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

docker compose ps

echo "\nDNS checks:"
dig @127.0.0.1 -p 5300 . SOA +dnssec +short || true
dig @127.0.0.1 -p 5301 zx. SOA +dnssec +short || true
dig @127.0.0.1 -p 5353 www.example.zx A +dnssec +short || true
