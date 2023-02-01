#!/usr/bin/env bash
# start a ros terminal with gui support
IPADDR=$(ifconfig $NIC | grep "inet " | awk '{print $2}')
DISP_NUM=$(jot -r 1 100 200)
PORT_NUM=$((6000 + DISP_NUM)) # so multiple instances of the container won't interfer with eachother
socat TCP-LISTEN:${PORT_NUM},reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" 2>&1 > /dev/null &
sudo docker exec -e $IPADDR:$DISP_NUM -it hcr bash

