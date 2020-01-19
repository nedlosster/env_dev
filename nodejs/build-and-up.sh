#!/bin/sh

if [ $(ps aux | grep ssh-agent | wc -l) -eq 0 ]; then
	echo "ssh-agent is not running"
	exit 1
fi

if [ $(ssh-add -l | grep id_rsa | wc -l) -ne 1 ]; then
	echo "add id_rsa to ssh-agent"
	ssh-add
fi


[ -f ~/.gitconfig ] || touch ~/.gitconfig

if [ "$1" = "test" ]; then
	echo "Test - using docker-compose.test.yml"
	DC_OPT1="-f docker-compose.test.yml"
elif [ ! -z "$1" ]; then
	echo "usage { no args | test}"
	exit 1
fi

dir=$(dirname "$(readlink -f "$0")")

#mkdir -p $dir/var_pgadmin4/pgadmin4_conf
#sudo chown -R 5050:5050 $dir/var_pgadmin4

docker-compose --project-name dev -f docker-compose.yml $DC_OPT1 up --build
