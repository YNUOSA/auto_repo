#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

remote_nfs_disk_path=$(cat ../REMOTE_NFS_DISK_PATH)
local_dir="$(cat ../NFS_LOCAL_DIR)"

if mount | grep $remote_nfs_disk_path | grep $local_dir;
then
	echo "umount nfs disk"
	sudo umount -f ${local_dir}
	echo "nfs disk $remote_nfs_disk_path has been umounted"
else
	echo "not mounted"
fi