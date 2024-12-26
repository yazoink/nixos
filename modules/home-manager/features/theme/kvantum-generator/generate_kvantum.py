#!/usr/bin/env python

# tries to generate a kvantum theme as close as similar as possible to the Gtk theme
# I know this code is ass, I'm very tired

# args:
# colors should be hex (without the hashtag at the start)
# 1: background color
# 2: foreground color
# 3: foreground highlight color
# 4: disabled foreground
# 5: accent color
# 6: base theme path
# 7: output path

from sys import argv
from os import path, mkdir

def main():
    new_colors = [
        hex_to_rgb(argv[1]), # bg0
        overlay_color(hex_to_rgb(argv[1]), hex_to_rgb(argv[2]), 0.1), # bg1
        overlay_color(hex_to_rgb(argv[1]), hex_to_rgb(argv[2]), 0.15), # bg2
        overlay_color(hex_to_rgb(argv[1]), hex_to_rgb(argv[5]), 0.9), # bg3
        overlay_color(hex_to_rgb(argv[1]), hex_to_rgb(argv[2]), 0.6), # bg4
        hex_to_rgb(argv[2]), # fg0
        hex_to_rgb(argv[3]), # fg1
        hex_to_rgb(argv[5]), # accent
        hex_to_rgb(argv[4]), # disabled fg
        overlay_color(hex_to_rgb(argv[1]), hex_to_rgb(argv[2]), 0.08), # divider
    ]

    old_kvconfig = file_to_string(f"{argv[6]}/KvRecolor.kvconfig")
    old_svg = file_to_string(f"{argv[6]}/KvRecolor.svg")

    new_kvconfig = replace_colors(old_kvconfig, new_colors)
    new_svg = replace_colors(old_svg, new_colors)

    if path.exists(argv[7]) == False:
        mkdir(argv[7])

    with open(f"{argv[7]}/KvLibadwaitaRecolor.kvconfig", "w") as file:
        file.write(new_kvconfig)

    with open(f"{argv[7]}/KvLibadwaitaRecolor.svg", "w") as file:
        file.write(new_svg)

def file_to_string(path):
    with open(path, "r") as file:
        file_content = file.read()
    return file_content

def hex_to_rgb(hex_color):
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hex(r, g, b):
    return '#{:02X}{:02X}{:02X}'.format(r, g, b)

def replace_colors(file_content, new_colors):
    old_colors = [
        "#1C1213",
        "#2A1C1B",
        "#30201F",
        "#462F2C",
        "#4D3431",
        "#A87569",
        "#C58D7B",
        "#893F45",
        "#6D4745",
        "#4A2E2F"
    ]
    for i in range(len(old_colors)):
        file_content = file_content.replace(old_colors[i], rgb_to_hex(int(new_colors[i][0]), int(new_colors[i][1]), int(new_colors[i][2])))
        file_content = file_content.replace(old_colors[i].lower(), rgb_to_hex(int(new_colors[i][0]), int(new_colors[i][1]), int(new_colors[i][2])))
    return file_content

def overlay_color(base, overlay, amount):
    r = base[0] + (overlay[0] - base[0]) * amount
    g = base[1] + (overlay[1] - base[1]) * amount
    b = base[2] + (overlay[2] - base[2]) * amount
    return (r, g, b)

main()
