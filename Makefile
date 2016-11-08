deploy_dir="_deploy_dir"

core_reverse_proxy_dir="core/reverse_proxy"
core_static_http_server_dir="core/static_http_server"

all:
		# Please use the tasks below:
		# make start	: start static http server normally
		# make start_reverse_proxy	: start reverse proxy

init:
	mkdir $(deploy_dir)

clean:
	# stop and clear reverse proxy
	cd $(core_reverse_proxy_dir); bash clean.sh

	rm -rf $(deploy_dir)

start: clean init
	# start static http server
	cd $(core_static_http_server_dir); bash start.sh


start_reverse_proxy: clean init
	# start reverse proxy
	cd $(core_reverse_proxy_dir); bash start.sh
