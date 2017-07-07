#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## create and cd var dir
mkdir -p $THE_VAR_DIR_PATH
cd $THE_VAR_DIR_PATH
#pwd


## https://help.ubuntu.com/community/Repositories/Personal
## https://help.ubuntu.com/community/AptGet/Offline/Repository
## deb file:///home/repository SuiteCodename main restricted universe multiverse

## /etc/apt/sources.list.d/demo.list
## deb [trusted=yes] file:///home/user/project/demo-repository-ubuntu/ubuntu xenial main
##echo 'deb [trusted=yes] file://'"$THE_REPOSITORY_DIR_PATH"' xenial main' | sudo tee /etc/apt/sources.list.d/demo.list

cat > demo-local.list << EOF
deb [trusted=yes] file://$THE_REPOSITORY_DIR_PATH xenial main
deb-src [trusted=yes] file://$THE_REPOSITORY_DIR_PATH xenial main

EOF

sudo cp demo-local.list /etc/apt/sources.list.d/demo-local.list
