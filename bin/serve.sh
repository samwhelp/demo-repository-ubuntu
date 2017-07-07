#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## cd document root dir
cd $THE_DOCUMENTROOT_DIR_PATH


## serve
php -S localhost:8080
