#!/bin/sh
if [ `grep "syncing" /private/repo_root_dir/status/mirrors.json &>> syncing.log` ];then
  reboot
else
  echo 'syncing, cancel reboot'
fi
