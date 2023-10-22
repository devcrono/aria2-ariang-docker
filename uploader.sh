#! /bin/bash -eu

if [ "$UPLOADER_CONFIG_GIST" != "" ]; then
curl -s "$UPLOADER_CONFIG_GIST" -o  /usr/local/bin/upload.env
fi