#!/bin/sh

. bin/vars.sh

bin/reset.sh
docker run -d --privileged --name $IMAGE_NAME --env-file config.env $NAMESPACE/$IMAGE_NAME:$VER
