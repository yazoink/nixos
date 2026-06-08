#!/usr/bin/env bash

pidof ironbar && pkill ironbar
ironbar &
disown
