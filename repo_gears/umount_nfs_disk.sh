#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

local_dir="$(cat NFS_LOCAL_DIR)"

if mount | grep $(cat REMOTE_NFS_DISK_PATH) | grep $(cat NFS_LOCAL_DIR);
then
	echo "umount nfs disk"
	sudo umount -f ${local_dir}
	echo "nfs disk $(cat REMOTE_NFS_DISK_PATH) has been umounted"
else
	echo "not mounted"
fi