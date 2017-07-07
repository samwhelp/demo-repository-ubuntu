#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## remove /etc/apt/sources.list.d/demo-github.list
echo 'rm /etc/apt/sources.list.d/demo-github.list'
sudo rm -f /etc/apt/sources.list.d/demo-github.list
