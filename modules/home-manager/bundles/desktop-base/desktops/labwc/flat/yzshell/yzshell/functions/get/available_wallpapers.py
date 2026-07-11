#!/usr/bin/env python

from os import listdir
from sys import argv, exit
from math import floor

# from PIL import Image
import json


def is_valid_image(file_name):
    l = file_name.lower()
    if (
        l.endswith(".png")
        or l.endswith(".jpg")
        or l.endswith(".jpeg")
        # or l.endswith(".gif")
    ):
        return True
    return False


columns = 3

if len(argv) < 1:
    exit(1)

dir = argv[1]
files = listdir(dir)
# print(files)

available_wallpapers = []
col = 0
row = 0

i = 0
image_files = []
for f in files:
    if is_valid_image(f):
        image_files.append(f)

if len(image_files) < 3:
    rows = 1
else:
    rows = floor(len(files) / 3)

i = 0
for row in range(0, rows):
    cols = 3
    available_wallpapers.append([])
    for _ in range(0, cols):
        if i < len(image_files):
            available_wallpapers[row].append(image_files[i])
            i += 1

print(json.dumps(available_wallpapers))
