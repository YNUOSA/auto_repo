#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

local_dir="$(cat ../../NFS_LOCAL_DIR)"

if ls -l ./html | grep $local_dir;
then
	echo 'dir already linked'
else
	echo 'linking...'
	ln -s $local_dir ./html
	echo 'static html dir has been linked to ./html'
fi
