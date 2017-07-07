#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


## cd repository root
cd $THE_REPOSITORY_DIR_PATH


## package
dpkg-scanpackages --arch=i386 pool/main | gzip -9c > dists/xenial/main/binary-i386/Packages.gz
dpkg-scanpackages --arch=amd64 pool/main | gzip -9c > dists/xenial/main/binary-amd64/Packages.gz

## source
dpkg-scansources pool/main | gzip -9c > dists/xenial/main/source/Sources.gz
