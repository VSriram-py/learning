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
