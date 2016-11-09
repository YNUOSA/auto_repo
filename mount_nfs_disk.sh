#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

remote_nfs_disk_path=$(cat ./REMOTE_NFS_DISK_PATH)
local_dir="$(cat ./NFS_LOCAL_DIR)"

if [ -e $local_dir ];
then:
	echo "local dir for nfs mounting is already exists"
else:
	echo "local dir for nfs disk is not exists. creating..."
	sudo mkdir -p $local_dir
	echo "local dir for nfs disk mouting created."
fi

if mount | grep $remote_nfs_disk_path | grep $local_dir;
then
	echo "nfs disk $remote_nfs_disk_path is already mounted"
else
	echo "mount nfs disk $remote_nfs_disk_path"
	sudo mount -o resvport,rw -t nfs $remote_nfs_disk_path $local_dir
	mount | grep $remote_nfs_disk_path | grep $local_dir
fi

