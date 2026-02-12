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
