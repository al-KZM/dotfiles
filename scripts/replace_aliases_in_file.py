import socket
import os
import sys

if len(sys.argv) != 3:
    sys.exit(f"# Usage: python {__file__} ALIASES_FILE DST_FILE")

aliases_file = sys.argv[1]
dst_file = sys.argv[2]

aliases = {}

# Read all the aliases
with open(aliases_file, 'r') as hosts_file:
    for line in hosts_file.readlines():
        if line.startswith("#"):
            continue

        host, alias = line.split()

        aliases[alias] = host

# Read the dst file and replace aliases with their value
out_lines = [f"# Aliased replaced from {aliases_file}\n", "\n"]
for line in open(dst_file, "r").readlines():
    newline = line
    for alias, value in aliases.items():
        newline = newline.replace(alias, value)

    if newline != line:
        print(f"[v] {line} -> {newline}")

    out_lines.append(newline)

open(dst_file, "w").writelines(out_lines)
