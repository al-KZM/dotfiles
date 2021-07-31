#!/usr/local/bin/python3
#
# download_random.py
# wallpaper
#
# Created by Eyal Shukrun on 03/02/20.
# Copyright 2020. Eyal Shukrun. All rights reserved.

import github
import os
import random
import requests
import shutil
import subprocess
import sys
import re

fnull = open(os.devnull, 'w')
#sys.stdout = fnull
basedir = os.path.abspath(os.path.dirname(__file__))
os.chdir(basedir)

def gen_list(dst='pics_list.txt'):
    download_url = "https://raw.githubusercontent.com/{}/master/{}"
    allowed_extensions = ['.jpg', '.jpe', '.png', '.jpeg', ]

    username = 'x41lakazam'
    passwd = input("Password for {}: ", username)
    g = github.Github(username,passwd)

    repo_name = 'LukeSmithxyz/wallpapers'

    repo = g.get_repo(repo_name)

    contents = repo.get_contents("")

    pics = []

    for content in contents:
        if content.type == 'dir':
            contents.extend(repo.get_contents(content.path))
        elif os.path.splitext(content.path)[1] in allowed_extensions:
            dl_url = download_url.format(repo_name, content.path)
            pics.append(dl_url)

    open(dst, 'w').write('\n'.join(pics))

    print("[download_random.py] Downloaded list of pics from {} to {}".format(repo_name, dst))

def download_pic(dst='wallpaper.png', src='pics_list.txt', _filter=None):
    lines = open(src, 'r').readlines()
    not_good = True
    rd_pic_url = random.choice(lines).strip()

    open("downloading.state", "w").write("1")

    print("[download_random.py] Downloading {}".format(rd_pic_url))
    #subprocess.call(['curl', rd_pic_url, '-o', dst], stdout=fnull, stderr=fnull)
    subprocess.call(['curl', rd_pic_url, '-o', dst])

    open("downloading.state", "w").write("0")

    return rd_pic_url

def download_astronomy_pic_of_the_day(dst='wallpaper.png', _filter=None):
    page_url = "https://apod.nasa.gov/apod/astropix.html"
    base_url = "https://apod.nasa.gov/apod/"
    source   = requests.get(page_url).text
    regex    = r'<IMG SRC="(?P<img_url>.+)"'
    img_uri  = re.search(regex, source).group('img_url')
    img_url  = base_url + img_uri
    subprocess.call(['curl', img_url, '-o', dst], stdout=fnull, stderr=fnull)


downloaded_pic = download_pic(dst='tomorrow.png', src="my_wallpapers.txt")
open("infos/tomorrow.png.current", 'w').write(downloaded_pic)
