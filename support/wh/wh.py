import json
import hmac
import hashlib

from flask import Flask, request, jsonify, abort
import salt

app = Flask(__name__)
app.debug = True
app.config.from_object('config')


@app.route('/', methods=['POST', 'GET'])
def foo():
    if request.method == 'GET':
        return jsonify(job_id=None, status='OK')
    incoming = request.headers['X-Hub-Signature']
    calculated = hmac.new(app.config['SECRET'], request.data, hashlib.sha1).hexdigest()
    if calculated != incoming.split('=')[-1]:
        abort(401, "Invalid hash")
    data = json.loads(request.data)
    if 'commits' in data:
        repo = data['repository']['name']
        if repo in app.config['HOOKS']:
            hook = app.config['HOOKS'][repo]
            ref = data['ref']
            if ref in hook:
                ss = hook[ref]
                client = salt.client.LocalClient()
                print ss
                rval = client.cmd_async(*ss, queue=True)
                return jsonify(job_id=rval)
    return jsonify(job_id=None, status='unknown app or ref')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
