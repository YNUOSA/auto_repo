#!/bin/bash

#re-gen reverse proxy list
python gen_hosts.py > etc/nginx/conf.d/auto_gen_reverse_proxy.conf

#clean start nginx
docker-compose up -d