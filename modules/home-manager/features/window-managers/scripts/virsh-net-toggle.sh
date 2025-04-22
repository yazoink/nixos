#!/usr/bin/env bash

function main() {
    status="$(toggle_network)"
    echo "$status"
    notify-send "Virsh" "Default network $status"
    exit 0
}

function toggle_network() {
    if [[ $EUID -ne 0 ]]; then
        exec pkexec "$0" "$@"
    fi
    status="$(virsh net-list --all | grep "default" | awk -F'[ \t]+' '{print $3}')"
    if [ "$status" == "active" ]; then
        virsh net-destroy default > /dev/null 2>&1
        echo "stopped"
        return 0
    fi
    virsh net-start default > /dev/null 2>&1
    echo "started"
    return 0
}

main
