#!/usr/bin/env bash

function configure_mako() {
	echo "
	actions=true
	anchor=bottom-right
	border-radius=16
	border-size=1
	default-timeout=5000
	icons=true
	layer=overlay
	margin=5,0,0
	outer-margin=5
	padding=16

	[mode=do-not-disturb]
	invisible=1
	" > "$YZSHELL_MAKO_CONF_FILE"
}