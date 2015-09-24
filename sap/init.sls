sap-app:
    git.latest:
        - name: git@github.com:au-easyshare/sap.git
        - user: sadmin
        - force: True
        - target: /home/sadmin/sap
        - identity: /home/sadmin/.ssh/esdeploy.priv


/home/sadmin/sap/ve:
  virtualenv.managed:
    - requirements: /home/sadmin/sap/requirements.txt
    - user: sadmin


sap-beta:
    service.running:
      - enable: True
      - watch: 
        - git: sap-app

sap-prod:
    service.running:
      - enable: True
      - watch: 
        - git: sap-app
