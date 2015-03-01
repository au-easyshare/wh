from flask import Flask, request, jsonify
import json
import salt

app = Flask(__name__)

hooks = {'app':
            {'refs/heads/beta':
                ['*', 'state.sls', ['beta_app']],
            'refs/heads/prod':
                ['*', 'state.sls', ['prod_app']]},
          'es_sa':
            {'refs/heads/master':
                ['*', 'state.sls', ['es_sa_app']]},
          'eservices':
            {'refs/heads/beta':
                ['*', 'state.sls', ['eservices_beta']]}
        }


@app.route('/', methods=['POST'])
def foo():
    data = json.loads(request.data)
    if 'commits' in data:
        repo = data['repository']['name']
        if repo in hooks:
            hook = hooks[repo]
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
