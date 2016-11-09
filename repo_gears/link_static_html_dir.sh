#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

static_http_server_dir="../core_gears/static_http_server"

if ls -l ./html | grep static_http_server;
then
	echo 'dir already linked'
else
	echo 'linking...'
	ln -s $static_http_server_dir ./html
	echo 'static html dir has been linked to ./html'
fi
