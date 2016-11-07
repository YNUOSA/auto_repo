#!/bin/bash

#re-gen reverse proxy list
python gen_reverse_proxy_conf.py > ./etc/nginx/conf.d/auto_gen_reverse_proxy.conf

#clean start nginx
docker-compose up -d