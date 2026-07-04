#!/usr/bin/env bash

eww update control_panel_visible=false
$1 & disown
