#!/usr/bin/env python

import json
from os import listdir, environ


colours_dir = environ["YZSHELL_COLOURS_DIR"]
schemes_list = listdir(colours_dir)

colourschemes = []
for sch in schemes_list:
    j = ""
    with open(f"{colours_dir}/{sch}", "r") as f:
        j = f.read()
    j = json.loads(j)
    j["id"] = sch.replace(".json", "")
    colourschemes.append(j)

print(json.dumps(colourschemes))
