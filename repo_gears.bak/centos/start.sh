#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

# re-fresh glboal value

local_dir="$(cat ../NFS_LOCAL_DIR)"
deepin_dir="$local_dir/centos"

mkdir -p $deepin_dir

# gen docker-compose.yml
python gen_docker_compose.py > docker-compose.yml


# start docker
sudo docker-compose build && sudo docker-compose up -d 
