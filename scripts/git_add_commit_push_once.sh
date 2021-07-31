#!/bin/bash
git_dir="$PWD/.git"
for i in "$@"
do
    case $i in
        -d=*|--git-dir=*)
            git_dir="${i#*=}"
        ;;
    esac
done

pwd=``

git --git-dir=$git_dir add .
git --git-dir=$git_dir commit -m ${1:-routine}
git --git-dir=$git_dir push origin master

