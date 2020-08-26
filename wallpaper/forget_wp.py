#!/usr/bin/python3
#
# remove_current_from_list.py
# wallpaper
#
# Created by Eyal Shukrun on 03/02/20.
# Copyright 2020. Eyal Shukrun. All rights reserved.

import os

pics_list = "my_wallpapers.txt"

basedir = os.path.abspath(os.path.dirname(__file__))
os.chdir(basedir)

current = open('infos/wallpaper.png.current','r').read()
wp_urls = list(map(lambda k: k.strip(), open(pics_list, 'r').readlines()))

print(f"Removing <{current}>",)
wp_urls.remove(current)

open(pics_list,'w').write('\n'.join(wp_urls))



