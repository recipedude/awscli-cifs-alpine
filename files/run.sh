#!/bin/sh

# mount CIFS/SMB volume
if [[ -z "${CIFS_SHARE}" ]]; then
	echo "CIFS_SHARE not set"
else
	if [[ -z "$CIFS_OPTS" ]]; then
		echo "mounting $CIFS_SHARE"
		mount.cifs -v $CIFS_SHARE /data
	else
		echo "mounting $CIFS_SHARE with options"
		mount.cifs -v $CIFS_SHARE /data -o $CIFS_OPTS
	fi
fi

# AWS CMD
if [[ -z "${AWS_S3_CMD}" ]]; then
	echo "AWS_S3_CMD not set, sleeping to leave the container running"
	sleep 100000000
else
	cd /data
	echo "Running: aws s3 $AWS_S3_CMD"
	date
	aws s3 $AWS_S3_CMD
fi

echo "finished"
date
