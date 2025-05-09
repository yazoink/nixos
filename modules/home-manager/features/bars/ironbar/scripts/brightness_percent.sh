#!/usr/bin/env bash

max=$(brightnessctl max)
current=$(brightnessctl get)
echo $(( 100 * current / max ))%
