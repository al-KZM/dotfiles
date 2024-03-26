import random
import sys
import os

def wrap(s, wrap_size):
    lines = []
    line  = ""
    words = s.split(' ')
    for i, word in enumerate(words):
        if len(line + word) > wrap_size:
            lines.append(line)
            line = ""
        line += word
        line += " "
    line = line[:-1]
    lines.append(line)

    return '_'.join(lines)

img_size  = 50
wrap_size = 40

file = "/Users/eshukrun/.config/neofetch/quotes.txt"
line = random.choice(open(file, 'r').readlines())

col = int(sys.argv[1])

if col > img_size + wrap_size:
    out = wrap(line, wrap_size)
else:
    out = "I'm using vim since 2006, mostly because I don't know how to exit it."
print(out)





