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
