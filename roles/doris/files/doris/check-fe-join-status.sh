#!/bin/sh

hostip=$1

JOIN_BOOL=$(/usr/bin/mysql -h 127.0.0.1 -P 9030 -u root -e "SHOW PROC '/frontends' \G"|grep -A 9 "Host: ${hostip}"|grep Join|awk '{ print $NF }')

ALIVE_BOOL=$(/usr/bin/mysql -h 127.0.0.1 -P 9030 -u root -e "SHOW PROC '/frontends' \G"|grep -A 9 "Host: ${hostip}"|grep Alive|awk '{ print $NF }')


if [ $JOIN_BOOL != "true" -o $ALIVE_BOOL != "true" ]; then
    echo "false"
else
    echo "true"
fi
