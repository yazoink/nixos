#!/usr/bin/env bash

function update_search_cache() {
    dest="$1"
    "$YZSHELL_FUNCTIONS_DIR"/update/search_cache.py
}

function update_search_results() {
    json_file="$1"
    query="$2"
    "$YZSHELL_FUNCTIONS_DIR"/update/search_results.py "$json_file" "$query"
}