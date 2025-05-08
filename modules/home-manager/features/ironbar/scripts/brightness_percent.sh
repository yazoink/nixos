#!/usr/bin/env bash

read -r current max < <(brightnessctl g m)
echo $(( 100 * current / max ))%
