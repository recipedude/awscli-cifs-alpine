#!/bin/sh

. bin/vars.sh

docker push $NAMESPACE/$IMAGE_NAME:$VER
docker tag $NAMESPACE/$IMAGE_NAME:$VER $NAMESPACE/$IMAGE_NAME:latest
docker push $NAMESPACE/$IMAGE_NAME:latest
