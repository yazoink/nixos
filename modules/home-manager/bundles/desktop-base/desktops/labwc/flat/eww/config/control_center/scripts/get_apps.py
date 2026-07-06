#!/usr/bin/env python

from gi.repository import Gio
from sys import argv
import json
import subprocess
import re
import os.path


def make_entry(app):
    return f"""
        (button
            :class "entry${{selected == {app["index"]} ? " selected" : ""}}"
            :onclick "${{selected == {app["index"]} ? "./control_center/scripts/search_launch.sh \\\"{app["exec"]}\\\" & eww update control_center_visible=false & pkill -SIGRTMIN+9 waybar &" : "eww update selected={app["index"]}"}}"
            :tooltip "{app["exec"]}"
            (box
                :orientation "h"
                :space-evenly false
                :spacing 8
                (image :icon "{app["icon"]}" :icon-size "dialog" :class "icon")
                (box
                    :orientation "v"
                    :space-evenly false
                    :valign "center"
                    (label 
                        :class "name" 
                        :halign "start"
                        :text "{app["name"]}" 
                        :truncate true 
                        :show-truncated false 
                        :limit-width 28
                    )
                    (label 
                        :class "desc" 
                        :halign "start"
                        :text "{app["desc"]}" 
                        :truncate true 
                        :show-truncated false 
                        :limit-width 28
                    )
                )
                (label :text "" :halign "end" :hexpand true :class "arrow")
            )
        )
        """


# get array of app info dictionaries:
# [
#   {
#     name: "<display name>",
#     desc: "<description>",
#     exec: "<executable>",
#     icon: "<icon name>",
#   }
# ]
def write_apps_file():
    apps_arr = []
    all_apps = Gio.AppInfo.get_all()
    i = 0
    for app in all_apps:
        if app.should_show() == False:
            continue
        name = app.get_display_name()
        desc = app.get_description()
        exec = ""
        terminal = app.get_boolean("Terminal")
        if terminal == True:
            exec += "foot -e "
        exec += app.get_commandline()
        exec = re.sub("%[a-zA-Z]", "", exec)
        exec = re.sub(" -- $", "", exec)
        # exec = re.sub(" *$", "", exec)
        bin = app.get_executable()
        icon = "question"
        icon_obj = app.get_icon()
        if icon_obj != None:
            icon = Gio.Icon.to_string(icon_obj)
        apps_arr.append(
            {
                "name": name,
                "desc": desc,
                "exec": exec,
                "icon": icon,
                "bin": bin,
                "index": i,
            }
        )
        i += 1
    j = json.dumps(apps_arr)
    with open("/tmp/launcher_apps.json", "w") as f:
        f.write(j)


def get_apps():
    if os.path.isfile("/tmp/launcher_apps.json") == False:
        write_apps_file()
    apps_arr = []
    with open("/tmp/launcher_apps.json", "r") as f:
        j = f.read()
        apps_arr = json.loads(j)
    selected = -1
    if len(argv) > 2:  # search specified
        if argv[2] != "":  # search not blank
            apps_arr = search(argv[2], apps_arr)
            selected = 0
    subprocess.Popen(f"eww update selected={selected}", shell=True)
    return apps_arr


def search(s, apps):
    r = []
    for app in apps:
        if s in app["name"].lower() or s in app["bin"]:
            if app["name"].lower().startswith(s) or app["bin"].startswith(s):
                r.insert(0, app)
            else:
                r.append(app)
    i = 0
    for app in r:
        r[i]["index"] = i
        i += 1
    return r


if len(argv) > 1:
    if argv[1] == "onchange":  # update literal widget
        apps = get_apps()
        content = ""
        if len(apps) == 0:  # if no results
            content += '(label :text "No results found..." :class "no-results")'
        else:  # make results
            for app in apps:
                content += make_entry(app)

        yuck = f"""
            (scroll
                :class "search-results"
                (box 
                    :orientation "v"
                    :valign "start"
                    :vexpand true
                    :spacing 8
                    {content}
                )
            )
            """

        subprocess.Popen(f"eww update search_results='{yuck}'", shell=True)
    elif argv[1] == "onaccept":  # open app / close launcher
        apps = get_apps()
        subprocess.Popen(
            "eww update control_center_visible=false & pkill -SIGRTMIN+9 waybar & eww update user_input='' &",
            shell=True,
        )
        selected = int(
            subprocess.check_output(f"eww get selected", text=True, shell=True)
        )
        if selected != -1:  # open app
            subprocess.Popen(
                f"./control_center/scripts/search_launch.sh '{apps[selected]["exec"]}' &",
                shell=True,
            )
    elif argv[1] == "update":
        write_apps_file()
