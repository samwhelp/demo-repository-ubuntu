## THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

find_dir_path () {
	if [ ! -d $(dirname -- "$1") ]; then
		dirname -- "$1"
		return 1
	fi
	echo $(cd -P -- "$(dirname -- "$1")" && pwd -P)
}

##THIS_BASE_DIR_PATH=$(find_dir_path $0)

base_var_init () {
	THE_BIN_DIR_NAME=bin
	THE_BIN_DIR_PATH=$(find_dir_path "$THE_BASE_DIR_PATH/../$THE_BIN_DIR_NAME/.")

	THE_REPOSITORY_DIR_NAME=ubuntu
	THE_REPOSITORY_DIR_PATH=$(find_dir_path "$THE_BASE_DIR_PATH/../$THE_REPOSITORY_DIR_NAME/.")

	THE_VAR_DIR_NAME=var
	THE_VAR_DIR_PATH=$(find_dir_path "$THE_BASE_DIR_PATH/../$THE_VAR_DIR_NAME/.")
}

base_var_dump () {
	echo '$THE_BIN_DIR_NAME:' $THE_BIN_DIR_NAME
	echo '$THE_BIN_DIR_PATH:' $THE_BIN_DIR_PATH

	echo '$THE_REPOSITORY_DIR_NAME:' $THE_REPOSITORY_DIR_NAME
	echo '$THE_REPOSITORY_DIR_PATH:' $THE_REPOSITORY_DIR_PATH

	echo '$THE_VAR_DIR_NAME:' $THE_VAR_DIR_NAME
	echo '$THE_VAR_DIR_PATH:' $THE_VAR_DIR_PATH

}
