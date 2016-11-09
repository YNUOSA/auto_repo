

core_reverse_proxy_dir="core_gears/reverse_proxy"
core_static_http_server_dir="core_gears/static_http_server"

repo_gears_dir="repo_gears"

all:
	# Please use the tasks below:
	# make start	: start static http server normally
	# make start_reverse_proxy	: start reverse proxy

init:
	# mount nfs
	cd $(repo_gears_dir); bash mount_nfs_disk.sh


clean:
	# stop and clear reverse proxy
	cd $(core_reverse_proxy_dir); bash clean.sh

	# stop and clear static http server
	cd $(core_static_http_server_dir); bash clean.sh

	# umount nfs
	cd $(repo_gears_dir); bash umount_nfs_disk.sh


start: clean init
	# start static http server
	cd $(core_static_http_server_dir); bash start.sh


start_reverse_proxy: clean init
	# start reverse proxy
	cd $(core_reverse_proxy_dir); bash start.sh
