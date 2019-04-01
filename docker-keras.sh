#!/bin/bash
##### CONFIGS #####
HOST_VOLUME="/Users/coldblaze/docker_works"
CONTAINER_MNT="/notebook"
NAME="keras"
HOST_NAME="keras"
##### END OF CONFIGS #####

_IMAGE="coldblaze/keras"
_IMAGE_TAG="latest"

case $1 in
pull)
   docker pull $_IMAGE:$_IMAGE_TAG
;;
run)
   echo ${0##$}" run"
   docker run \
   --interactive --tty \
   --rm \
   --hostname $HOST_NAME --name $NAME \
   --publish 22:22 \
   --publish 8888:8888 \
   --publish 6006:6006 \
   --publish 5000:5000 \
   --volume $HOST_VOLUME:$CONTAINER_MNT:rw \
   $_IMAGE:$_IMAGE_TAG
;;
stop)
    echo ${0##$}" stop"
    docker stop $NAME
    docker rm $NAME
;; 
*)
    echo "Usage: ./"${0##*/}" [pull|run|stop]"
;;
esac
