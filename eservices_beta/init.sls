eservices-app-beta:
    git.latest:
        - name: git@github.com:au-easyshare/eservices.git
        - rev: beta
        - user: www-data
        - force: True
        - target: /data/var/www/eservices_beta
        - identity: /data/var/www/.ssh/id_rsa


/data/var/www/eservices_beta/eservice.wsgi:
    file.touch:
    - require: 
        - git.latest: eservices-app-beta

/data/var/www/eservices_beta/ve:
  virtualenv.managed:
    - requirements: /data/var/www/eservices_beta/requirements.txt
    - user: www-data
