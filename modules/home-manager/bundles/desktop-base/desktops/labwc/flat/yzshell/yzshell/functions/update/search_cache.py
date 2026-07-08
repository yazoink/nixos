#!/usr/bin/env python

# ./update_json.py <output>

from gi.repository import Gio
from sys import exit
import json
import re
from os import environ


def arr_to_json_file(arr, target):
    j = json.dumps(arr)
    with open(target, "w") as f:
        f.write(j)

# get array of apps
def get_apps_arr():
    apps_arr = []
    all_apps = Gio.AppInfo.get_all()
    i = 0
    for app in all_apps:
        if app.should_show() == False:
            continue
        cmd = ""
        if app.get_boolean("Terminal"):
            cmd = f"{environ["TERM"]} -e "
        cmd += app.get_commandline()
        cmd = re.sub("%[a-zA-Z]", "", cmd)
        cmd = re.sub(" -- $", "", cmd)
        icon = "question"
        icon_obj = app.get_icon()
        if icon_obj != None:
            icon = Gio.Icon.to_string(icon_obj)
        desc = app.get_description()
        if desc == None:
            desc = "No description"
        apps_arr.append(
            {
                "name": app.get_display_name(),
                "desc": desc,
                "cmd": cmd, # launch command
                "icon": icon,
                "bin": app.get_executable(), # base binary file
                "index": i,
            }
        )
        i += 1
    return apps_arr

def main():
    target = environ["YZSHELL_APP_SEARCH_CACHE_FILE"]
    apps_arr = get_apps_arr()
    #print(apps_arr)
    arr_to_json_file(apps_arr, target)


main()
