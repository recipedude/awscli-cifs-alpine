#!/bin/sh

. bin/vars.sh

docker build -t $NAMESPACE/$IMAGE_NAME:$VER .
