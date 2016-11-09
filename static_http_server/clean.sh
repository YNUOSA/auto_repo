#!/bin/bash

docker-compose stop
yes | docker-compose rm

bash ./unlink_static_html_dir.sh
