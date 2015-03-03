es-sa-app:
    git.latest:
        - name: git@github.com:au-easyshare/es_sa.git
        - rev: master
        - user: www-data
        - force: True
        - target: /data/var/www/sa.internal.easy-share.com.au
        - identity: /data/var/www/.ssh/id_rsa
