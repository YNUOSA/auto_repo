

core_static_http_server_dir="static_http_server"

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
	cd $(core_static_http_server_dir); bash clean.sh

	# umount nfs
	bash umount_nfs_disk.sh


start: init
	# start static http server
	cd $(core_static_http_server_dir); bash start.sh

