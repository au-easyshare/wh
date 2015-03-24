sap-app:
    git.latest:
        - name: git@github.com:au-easyshare/sap.git
        - user: sadmin
        - force: True
        - target: /home/sadmin/sap
        - identity: /home/sadmin/.ssh/id_rsa


/home/sadmin/sap/ve:
  virtualenv.managed:
    - requirements: /home/sadmin/sap/requirements.txt
    - user: sadmin


sap:
    service.running:
      - enable: True
      - watch: 
        - git: sap-app
