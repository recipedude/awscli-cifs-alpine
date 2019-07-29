#!/bin/sh

. bin/vars.sh

docker stop $IMAGE_NAME
docker rm $IMAGE_NAME
