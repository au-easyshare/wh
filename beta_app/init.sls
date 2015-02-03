beta-app:
    git.latest:
        - name: git@github.com:au-easyshare/app.git
        - rev: beta
        - user: www-data
        - force: True
        - target: /data/var/www/beta.easy-share.com.au
        - identity: /data/var/www/.ssh/id_rsa

pre-prod-app:
    git.latest:
        - name: git@github.com:au-easyshare/app.git
        - rev: beta
        - user: www-data
        - force: True
        - target: /data/var/www/pre_prod
        - identity: /data/var/www/.ssh/id_rsa
