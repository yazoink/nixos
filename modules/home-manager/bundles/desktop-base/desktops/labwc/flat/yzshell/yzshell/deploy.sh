#!/usr/bin/env bash

INSTALL_DIR="${HOME}/.local/share/yzshell"
EWW_DIR="${INSTALL_DIR}/eww"
FUNC_DIR="${INSTALL_DIR}/functions"
COLOURS_DIR="${INSTALL_DIR}/colourschemes"
ASSETS_DIR="${INSTALL_DIR}/assets"
CONFIG_DIR="${INSTALL_DIR}/configs"

function delete_make_dir() {
	[ -d "$1" ] && rm -rf "$1"
	mkdir -p "$1"
	if [ $? == 0 ]; then
		echo "created directory '${1}'"
	else
		echo "something went wrong: could not create directory '${1}'"
		exit 1
	fi
}

function copy_configs() {
	cp -r "$1" "$2"
	if [ $? == 0 ]; then
		echo "copied '${1}' to '${2}'"
	else
		echo "something went wrong: could not copy '${1}' to '${2}'"
		exit 1
	fi
}

delete_make_dir "$INSTALL_DIR"
copy_configs ./eww "$EWW_DIR"
copy_configs ./functions "$FUNC_DIR"
copy_configs ./colourschemes "$COLOURS_DIR"
copy_configs ./assets "$ASSETS_DIR"
copy_configs ./configs "$CONFIG_DIR"

echo "done!"