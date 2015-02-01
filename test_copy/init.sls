/tmp/crap:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://test_copy/tconfig/hello.txt
