#!/bin/sh

hostip=$1

ALIVE_BOOL=$(/usr/bin/mysql -h 127.0.0.1 -P 9030 -u root -e "SHOW PROC '/backends' \G"|grep -A 7 "Host: ${hostip}"|grep Alive|awk '{ print $NF }')


if [ $ALIVE_BOOL != "true" ]; then
    echo "false"
else
    echo "true"
fi
