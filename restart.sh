#!/bin/sh
t=`date "+%Y%m%d%H%M%S"`
sudo mv /private/repo_root_dir/status/auto_repo.log "/etc/bakup/rinetd.conf.$t"
sudo make clean && make start
