#!/bin/sh

. bin/vars.sh
docker stop $IMAGE_NAME
docker rm $IMAGE_NAME
docker run -d --privileged --name $IMAGE_NAME --env-file config.env $NAMESPACE/$IMAGE_NAME:$VER
