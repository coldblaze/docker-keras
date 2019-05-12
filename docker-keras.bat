SET HOST_VOLUME="C:\Users\coldblaze\docker_works"
SET CONTAINER_MNT="/notebook"
SET NAME="keras"
SET HOST_NAME="keras"
##### END OF CONFIGS #####

SET _IMAGE="coldblaze/keras"
SET _IMAGE_TAG="latest"

docker run --interactive --tty --rm --hostname %HOST_NAME% --name %NAME% --publish 22:22 --publish 8888:8888 --publish 6006:6006 --publish 5000:5000 --volume %HOST_VOLUME%:%CONTAINER_MNT%:rw %_IMAGE%:%_IMAGE_TAG%
