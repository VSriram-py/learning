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
