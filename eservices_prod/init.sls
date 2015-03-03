eservices-app-prod:
    git.latest:
        - name: git@github.com:au-easyshare/eservices.git
        - rev: prod
        - user: www-data
        - force: True
        - target: /data/var/www/eservices_prod
        - identity: /data/var/www/.ssh/id_rsa


/data/var/www/eservices_prod/eservice.wsgi:
    file.touch:
    - require: 
        - git.latest: eservices-app-prod

/data/var/www/eservices_prod/ve:
  virtualenv.managed:
    - requirements: /data/var/www/eservices_prod/requirements.txt
    - user: www-data
