#!/usr/bin/env bash

pidof ironbar && pkill ironbar
echo "---" | tee -a /tmp/ironbar.log
ironbar 2>&1 | tee -a /tmp/ironbar.log & disown
