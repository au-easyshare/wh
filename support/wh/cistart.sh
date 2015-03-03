#gunicorn -b 0.0.0.0:8000 wh:app --daemon
APPDIR=/usr/lib/salt/support/wh
$APPDIR/ve/bin/gunicorn -b 0.0.0.0:8000 wh:app 

