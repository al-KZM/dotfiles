import socket
import os
import sys

if os.geteuid() != 0:
    sys.exit("This script should be run with root privileges")

if len(sys.argv) != 2:
    sys.exit(f"Usage: python {__file__} INPUT_FILE")

file = sys.argv[1]
#file = "/etc/hosts.sixgill_stage"

current_lines = list(open(file, 'r').readlines())
out_lines = ["\n", f"# Auto-generated from {file}\n"]

with open(file, 'r') as hosts_file:
    for line in hosts_file.readlines():
        if line.startswith("#"):
            continue
        host, alias = line.split()
        try:
            host_ip = socket.gethostbyname_ex(host)[2][0]
        except:
            print("Can't resolve", host)
            continue

        if not host_ip:
            print("Can't resolve", host)
            continue

        l = f"{host_ip}\t\t\t{alias}\n"
        if l in current_lines:
            print(f"Line <{l}> already exists in file")
            continue

        out_lines.append(l)

open("/etc/hosts", "a").writelines(out_lines)
