#!/bin/sh

/usr/games/steamcmd +runscript /srv/l4d2server/update.txt

/srv/l4d2server/srcds_run -ip $SRCDS_BIND_IP -port $SRCDS_BIND_PORT -secure +map c5m1_waterfront