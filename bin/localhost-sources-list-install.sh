#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## create and cd var dir
mkdir -p $THE_VAR_DIR_PATH
cd $THE_VAR_DIR_PATH
#pwd


## /etc/apt/sources.list.d/demo-localhost.list
cat > demo-localhost.list << EOF
deb [trusted=yes] http://localhost:8080/ubuntu xenial main
deb-src [trusted=yes] http://localhost:8080/ubuntu xenial main

EOF

sudo cp demo-localhost.list /etc/apt/sources.list.d/demo-localhost.list
