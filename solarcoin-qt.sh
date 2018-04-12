#!/bin/bash

XSOCK=/tmp/.X11-unix
SOLARCOIN_VOLUME=solarcoin

docker volume create $SOLARCOIN_VOLUME

docker start solarcoin-qt &>2 || docker run --detach --name solarcoin-qt -e DISPLAY=$DISPLAY -v $XSOCK:$XSOCK -v $SOLARCOIN_VOLUME:/home/solarcoin solarcoin-qt
