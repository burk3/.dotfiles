update_home:
	bin/update_home

test:
	bin/update_home -n

init:
	git submodule init
	git submodule update
	git submodule status
