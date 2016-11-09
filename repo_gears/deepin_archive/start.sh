#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

# re-fresh glboal value

local_dir="$(cat ../NFS_LOCAL_DIR)"
deepin_dir="$local_dir/deepin"

mkdir -p $deepin_dir

echo "deepin_dir=\"$deepin_dir\"" > .env


# start docker
docker-compose build && docker-compose up
