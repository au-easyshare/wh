/tmp/crap:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://tests/tconfig/hello.txt
