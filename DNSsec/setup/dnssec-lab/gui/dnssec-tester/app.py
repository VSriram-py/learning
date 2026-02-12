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
