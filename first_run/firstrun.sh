#!/usr/bin/env bash
#
# Created by thiswind on 2016/11/18.
#

echo "change apt-get source"
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp ./sources.list.tuna /etc/apt/sources.list


echo "install dependency"
apt-get install python
apt-get install python-dev
apt-get install python-pip
apt-get install nfs-common

pip install --upgrade pip


echo "install docker"
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://mirrors.tuna.tsinghua.edu.cn/docker/apt/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install docker-engine

curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://db573425.m.daocloud.io

sleep 2

systemctl restart docker.service

pip install docker-compose

sudo usermod -aG docker thiswind

echo "pre download image"

docker pull nginx:1.11.5
docker pull ubuntu:16.04