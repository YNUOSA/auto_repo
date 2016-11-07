deploy_dir="_deploy_dir"

core_reverse_proxy_dir="core/reverse_proxy"

all:
	echo "Please use the tasks below:"
	echo "make start"

init:
	mkdir $(deploy_dir)

clean:
	# stop and clear reverse proxy
	cd $(core_reverse_proxy_dir); bash clean.sh

	rm -rf $(deploy_dir)

start: clean init
	# start reverse proxy
	cd $(core_reverse_proxy_dir); bash start.sh
