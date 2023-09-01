#! /bin/bash -eu

if [ "$PROXY" != "" ]; then
gost -L=:1234 -F="$PROXY" > /dev/null 2>&1
fi