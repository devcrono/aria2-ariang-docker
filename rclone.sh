#! /bin/bash -eu

if [ "$RCLONE_CONFIG_GIST" != "" ]; then
curl -s "$RCLONE_CONFIG_GIST" -o  /app/conf/rclone.conf
fi
