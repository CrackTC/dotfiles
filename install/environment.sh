#!/usr/bin/sh
path="$(cd "$(dirname $0)";cd ..;pwd)"

sudo cp --remove-destination $path/environment /etc/environment
