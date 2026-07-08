#!/usr/bin/env python

# ./search_results.py <json file path> <search string>

from gi.repository import Gio
from sys import argv
import json
import subprocess
import re
import os.path

def get_apps_arr(json_file):
    if os.path.isfile(json_file) == False:
        #print(f"File '{json_file}' does not exist...")
        exit(1)
    with open(json_file, "r") as f:
        j = f.read()
        apps_arr = json.loads(j)
    return apps_arr


def search(apps_arr, search_str):
    result = []
    for app in apps_arr:
        if search_str in app["name"].lower() or search_str in app["bin"]:
            if app["name"].lower().startswith(search_str) or app["bin"].startswith(search_str):
                result.insert(0, app)
            else:
                result.append(app)
    i = 0
    for app in result:
        result[i]["index"] = i
        i += 1
    return result


def main():
    if len(argv) < 2: 
        #print("Error: no file specified")
        exit(1)
    search_str = ""
    if len(argv) > 2:
        search_str = argv[2]

    json_file = argv[1]
    apps_arr = get_apps_arr(json_file)

    if search_str != "":
        apps_arr = search(apps_arr, search_str)

    # print json
    print(json.dumps(apps_arr))


main()