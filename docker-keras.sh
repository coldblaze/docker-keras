#!/bin/bash
##### CONFIGS #####
HOST_VOLUME="/Users/coldblaze/docker_works"
CONTAINER_MNT="/notebook"
NAME="keras"
HOST_NAME="keras"
NETWORK_CARD="en1"
##### END OF CONFIGS #####

_IMAGE="coldblaze/keras"
_IMAGE_TAG="latest"

case $1 in
pull)
   docker pull $_IMAGE:$_IMAGE_TAG
   ;;
run)
    echo ${0##$}" run"
    # For macOS with socat
    case "$OSTYPE" in
    darwin*)
        _MY_IP=`ipconfig getifaddr $NETWORK_CARD`
        
        docker run \
        --interactive --tty \
        --rm \
        --hostname $HOST_NAME --name $NAME \
        --publish 22:22 \
        --publish 8888:8888 \
        --publish 6006:6006 \
        --publish 5000:5000 \
        --volume $HOST_VOLUME:$CONTAINER_MNT:rw \
        --env DISPLAY=$_MY_IP:0 \
        $_IMAGE:$_IMAGE_TAG
    ;;
    linux*)
        xhost +local:
        docker run \
        --interactive --tty \
        --rm \
        --hostname $HOST_NAME --name $NAME \
        --publish 22:22 \
        --publish 8888:8888 \
        --publish 6006:6006 \
        --publish 5000:5000 \
        --volume $HOST_VOLUME:$CONTAINER_MNT:rw \
        --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
        --env DISPLAY=unix$DISPLAY \
        $_IMAGE:$_IMAGE_TAG
    ;;
    esac
;;
stop)
    echo ${0##$}" stop"
    docker stop $NAME
    docker rm $NAME
;; 
*)
    echo "Usage: ./"${0##*/}" [run|stop]"
;;
esac
