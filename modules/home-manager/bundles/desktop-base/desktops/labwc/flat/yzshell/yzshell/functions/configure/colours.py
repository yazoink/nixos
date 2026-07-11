#!/usr/bin/env python

from os import environ, path
from sys import exit, argv
import json

if len(argv) < 2:
    exit(1)

colours_dir = environ["YZSHELL_COLOURS_DIR"]
scheme_name = environ["COLOURSCHEME"]
user_colours_dir = environ["YZSHELL_USER_COLOURS_DIR"]
scheme_path = f"{user_colours_dir}/{scheme_name}.json"

if path.isfile(scheme_path) == False:
    scheme_path = f"{colours_dir}/{scheme_name}.json"
    if path.isfile(scheme_path) == False:
        print(f"Error: colourscheme {scheme_name} does not exist.")
        exit(1)

j = ""
with open(scheme_path, "r") as f:
    j = f.read()

scheme = json.loads(j)

if argv[1] == "eww":
    surface = "rgba(255, 255, 255, 0.09)"
    surface_lighter = "rgba(255, 255, 255, 0.18)"
    disabled = "rgba(255, 255, 255, 0.4)"
    if "light" in scheme["scheme"].lower():
        surface = "rgba(0, 0, 0, 0.09)"
    css = ""
    for c in scheme:
        if c == "scheme" or c == "author" or c == "id":
            continue
        css += f"${c}: #{scheme[c]};\n"

    css += f"""
    $bg: $base00;
    $fg: $base05;
    $disabled: {disabled};
    $surface: {surface};
    $surface-lighter: {surface_lighter};
    $border: $base01;
    $image-shadow: none;
    """

    # print(css)

    with open(environ["YZSHELL_EWW_CSS_COLOURS_FILE"], "w") as f:
        f.write(css)
elif argv[1] == "waybar":
    css = ""
    surface = "rgba(255, 255, 255, 0.09)"
    if "light" in scheme["scheme"].lower():
        surface = "rgba(0, 0, 0, 0.09)"
    for c in scheme:
        if c == "scheme" or c == "author" or c == "id":
            continue
        css += f"@define-color {c} #{scheme[c]};\n"

    css += f"""
    @define-color bg @base00;
    @define-color bg2 {surface};
    @define-color fg @base05;
    @define-color unfocused @base04;
    @define-color urgent @base08;
    @define-color border @base01;
    @define-color accent @base0D;
    """

    with open(environ["YZSHELL_WAYBAR_CSS_COLOURS_FILE"], "w") as f:
        f.write(css)
elif argv[1] == "mako":
    cfg = f"""
    background-color=#{scheme["base00"]}
    border-color=#{scheme["base01"]}
    progress-color=over #{scheme["base05"]}
    text-color=#{scheme["base05"]}
    """

    with open(environ["YZSHELL_MAKO_COLOURS_FILE"], "w") as f:
        f.write(cfg)
