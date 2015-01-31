beta-app:
    git.latest:
        - name: git@github.com:au-easyshare/app.git
        - rev: master
        - user: beta_app
        - force: True
        - target: /home/beta_app/beta.easy-share.com.au
        - identity: /home/beta_app/.ssh/id_rsa
