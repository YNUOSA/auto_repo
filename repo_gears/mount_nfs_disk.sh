#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

remote_nfs_disk_path=$(cat REMOTE_NFS_DISK_PATH)
local_dir="$(cat NFS_LOCAL_DIR)"

if mount | grep $(cat REMOTE_NFS_DISK_PATH) | grep $(cat NFS_LOCAL_DIR);
then
	echo "nfs disk $(cat REMOTE_NFS_DISK_PATH) is already mounted"
else
	echo "mount nfs disk $(cat REMOTE_NFS_DISK_PATH)"
	sudo mount -o resvport,rw -t nfs $remote_nfs_disk_path $local_dir
	mount | grep $(cat REMOTE_NFS_DISK_PATH) | grep $(cat NFS_LOCAL_DIR)
fi
