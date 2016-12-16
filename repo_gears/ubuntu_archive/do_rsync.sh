#!/usr/bin/env bash

#
# Created by thiswind on 2016/11/9.
#

#rsync -av --delete-after rsync.deepin.com::deepin/ /var/www/deepin/
#rsync -v -r --delete-after rsync.deepin.com::releases/ /var/www/deepin/
rsync -av --delete-after rsync://mirrors.tuna.tsinghua.edu.cn/ubuntu/ /var/www/deepin/
