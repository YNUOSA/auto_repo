#!/bin/sh
t=`date "+%Y%m%d%H%M%S"`
sudo mv /private/repo_root_dir/status/auto-repo.log "/private/repo_root_dir/status/auto-repo.log.$t"
sudo bash /home/strrl/auto_repo/repo_gears/clean_all.sh 
sudo bash /home/strrl/auto_repo/mount_nfs_disk.sh
sleep 60
sudo bash /home/strrl/auto_repo/repo_gears/start_all.sh
