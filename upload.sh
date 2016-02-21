#!/bin/sh

if [ -z "$1" ]; then
    echo "No destination host defined (user@host)"
    exit 1
fi

echo "Packing install files"

tar -czf myhome.tar.gz \
--exclude .DS_Store \
--exclude .git \
--exclude .gitignore \
--exclude *.egg-info \
--exclude *.pyc \
backdoor/ console/

echo "Uploading install files to $1"
scp myhome.tar.gz install_env.sh install.sh $1:
