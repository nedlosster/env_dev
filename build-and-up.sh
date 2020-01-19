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

dir=$(dirname "$(readlink -f "$0")")

#mkdir -p $dir/var_pgadmin4/pgadmin4_conf
#sudo chown -R 5050:5050 $dir/var_pgadmin4

docker-compose --project-name dev -f docker-compose.yml -f docker-compose-nodejs.yml -f docker-compose-python.yml -f docker-compose-cpp.yml  up --build
