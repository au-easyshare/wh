prod-app:
    git.latest:
        - name: git@github.com:au-easyshare/app.git
        - rev: prod
        - user: www-data
        - force: True
        - target: /data/var/www/www.easy-share.com.au
        - identity: /data/var/www/.ssh/id_rsa
