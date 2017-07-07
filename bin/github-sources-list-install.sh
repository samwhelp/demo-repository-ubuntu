#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## create and cd var dir
mkdir -p $THE_VAR_DIR_PATH
cd $THE_VAR_DIR_PATH
#pwd


## /etc/apt/sources.list.d/demo-github.list
cat > demo-github.list << EOF
deb [trusted=yes] https://samwhelp.github.io/demo-repository-ubuntu/ubuntu xenial main
deb-src [trusted=yes] https://samwhelp.github.io/demo-repository-ubuntu/ubuntu xenial main

EOF

sudo cp demo-github.list /etc/apt/sources.list.d/demo-github.list
