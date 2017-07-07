#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## cd repository root
cd $THE_REPOSITORY_DIR_PATH


## create dir
mkdir -p dists/xenial/main/binary-i386
mkdir -p dists/xenial/main/binary-amd64
mkdir -p dists/xenial/main/source

for dir_name in {a..z}; do
	mkdir -p pool/main/$dir_name
done
