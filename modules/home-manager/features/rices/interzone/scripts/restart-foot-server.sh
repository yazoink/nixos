#!/usr/bin/env bash

pkill foot
foot --server &
disown
notify-send "Foot" "Server restarted" -i foot
