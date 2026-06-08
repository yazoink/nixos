#!/usr/bin/env bash

version="$(grep -E '^VERSION=' /etc/os-release | sed 's/VERSION=//;s/\"//g')"
name="$(grep -E '^NAME=' /etc/os-release | sed 's/NAME=//')"

echo "$name $version"
