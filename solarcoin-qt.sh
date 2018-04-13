#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
SOLARCOIN_VOLUME=solarcoin

# Allow docker container to access the host X11 server
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 644 $XAUTH

docker volume create $SOLARCOIN_VOLUME

docker run -it --rm --name solarcoin-qt -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -v $SOLARCOIN_VOLUME:/home/solarcoin solarcoin-qt

