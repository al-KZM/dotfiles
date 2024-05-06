#!/bin/bash

target_dir="/home/eyal/documents/work/dev-institute/classes/q6-2020/pynews"

 git -C $target_dir pull origin master
 git -C $target_dir add .
 git -C $target_dir commit -m "routine"
 git -C $target_dir push origin master --force

 sleep 15

 git -C $target_dir pull origin master
 git -C $target_dir add .
 git -C $target_dir commit -m "routine"
 git -C $target_dir push origin master --force

 sleep 15

 git -C $target_dir pull origin master
 git -C $target_dir add .
 git -C $target_dir commit -m "routine"
 git -C $target_dir push origin master --force

 sleep 15

 git -C $target_dir pull origin master
 git -C $target_dir add .
 git -C $target_dir commit -m "routine"
 git -C $target_dir push origin master --force
