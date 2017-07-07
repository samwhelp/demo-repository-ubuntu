#!/usr/bin/env bash

## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $THE_BASE_DIR_PATH/_init.sh


usage()
{
	echo ""
	echo "Usage: make [command]"
	echo
	cat <<EOF
Ex:
$ make
$ make help

$ make update

$ make serve

$ make sources-list-install
$ make sources-list-remove

$ make localhost-sources-list-install
$ make localhost-sources-list-remove

$ make github-sources-list-install
$ make github-sources-list-remove

EOF
}

usage
