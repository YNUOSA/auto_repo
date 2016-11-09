#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

rsync -av --delete-after rsync.deepin.com::deepin/ /var/www/deepin/

