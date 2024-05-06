#!/bin/bash
source "`ueberzug library`"

# process substitution example:
ImageLayer 0< <(
    ImageLayer::add [identifier]="example0" [x]="0" [y]="0" [path]="/some/path/some_image0.jpg"
    ImageLayer::add [identifier]="example1" [x]="10" [y]="0" [path]="/some/path/some_image1.jpg"
    sleep 5
    ImageLayer::remove [identifier]="example0"
    sleep 5
)

# group commands example:
{
    ImageLayer::add [identifier]="example0" [x]="0" [y]="0" [path]="/some/path/some_image0.jpg"
    ImageLayer::add [identifier]="example1" [x]="10" [y]="0" [path]="/some/path/some_image1.jpg"
    read
    ImageLayer::remove [identifier]="example0"
    read
} | ImageLayer

