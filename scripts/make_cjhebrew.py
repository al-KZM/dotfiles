#!/usr/bin/python3

##############################################
#
# make_cjhebrew.py
# scripts
#
##############################################
import sys

signs2heb = {
    "'":"א",
    "b": "ב",
    "g": "ג",
    "d": "ד",
    "h": "ה",
    "w": "ו",
    "z": "ז",
    ".h":"ח",
    ".t":"ט",
    "y": "י",
    "k": "כ",
    "K": "ך",
    "l": "ל",
    "m": "מ",
    "M": "ם",
    "n": "נ",
    "N": "ן",
    "s": "ס",
    "`":"ע",
    "p": "פ",
    "P": "ף",
    ".s": "צ",
    ".S": "ץ",
    "q": "ק",
    "r": "ר",
    "/s":"ש",
    "t": "ת",
}

heb2signs = {v:k for k,v in signs2heb.items()}

heb     = list(sys.stdin)
signs   = ""

for line in heb:
    for char in line:
        signs += heb2signs.get(char, char)

print(signs)




