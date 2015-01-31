from flask import Flask, request, jsonify
import json
import salt

app = Flask(__name__)

hooks = {'pmm': {'refs/heads/beta': ['*', 'state.sls', ['beta_app']]}}


@app.route('/', methods=['POST'])
def foo():
    data = json.loads(request.data)
    print request.data
    print data
    if 'commits' in data:
        # print "New commit by: {}".format(data['commits'][0]['author']['name'])
        repo = data['repository']['name']
        if repo in hooks:
            hook = hooks[repo]
            ref = data['ref']
            if ref in hook:
                ss = hook[ref]
                client = salt.client.LocalClient()
                rval = client.cmd(*ss)
                print "OK"
                return jsonify(rval)
        else:
            print "not commit"
    return "OK"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
