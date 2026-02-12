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
