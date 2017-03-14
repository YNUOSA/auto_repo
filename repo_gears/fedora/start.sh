#!/usr/bin/env bash

# re-fresh glboal value

local_dir="$(cat ../../NFS_LOCAL_DIR)"
deepin_dir="$local_dir/fedora"

mkdir -p $deepin_dir

rm docker-compose.yml

# gen docker-compose.yml
python gen_docker_compose.py > docker-compose.yml


# start docker
docker-compose build && docker-compose up -d