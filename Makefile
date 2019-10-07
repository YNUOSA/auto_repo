

#core_static_http_server_dir="static_http_server"

repo_gears_dir="repo_gears"

all:
	# Please use the tasks below:
	# make start	: start static http server normally
	# make start_reverse_proxy	: start reverse proxy
init:
	# re-fresh global value
	cp -f NFS_LOCAL_DIR $(repo_gears_dir)
	# mount nfs
	bash mount_nfs_disk.sh
clean:
	# stop and clear static http server
	#cd $(core_static_http_server_dir); bash clean.sh
	
	# stop and clear cadvisor
	cd cadvisor; bash clean.sh
	
	# stop and clear deepin_archive
	#cd $(repo_gears_dir)/deepin_archive; bash clean.sh
	cd $(repo_gears_dir); bash clean_all.sh

	# umount nfs
	bash umount_nfs_disk.sh


start: init
	# rebuild rsync script
	cd build/mirror; python gen_mirror_conf.py
	
	# start static http server
	#cd $(core_static_http_server_dir); bash start.sh
	
	#start cadvisor
	cd cadvisor;bash start.sh

	#### start repo rsyncs ####
	
	# start all archive
	cd $(repo_gears_dir); bash start_all.sh
# only used for ubuntu 14.04
ubuntu_install:
	# install nfs-common
	sudo apt-get install -y nfs-common

# so dangerious!!!
#	# install docker with tuna.moe repo
#	sudo apt-key adv --keyserver hkp://#p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#	echo "deb https://mirrors.tuna.tsin#ghua.edu.cn/docker/apt/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
#	sudo apt-get remove -y lxc-docker*
#	sudo apt-get update
#	sudo apt-get install -y docker-engine

	# set docker faster repo
	curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://db573425.m.daocloud.io
	sudo service docker restart

	# pre-pull docker images
	docker pull nginx:1.11.5
	docker pull ynuosa2016/ubuntu:16.04

