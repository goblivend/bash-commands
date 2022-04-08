import sys
import os

# print('cmd entry:', sys.argv)

name = sys.argv[1]
CDTO_PATH = sys.argv[2]

content = []
with open(CDTO_PATH, 'r') as f:
    lines = f.readlines()
length = len(lines)
i = 0
while i < length and not "esac" in lines[i]:
    l = lines[i]
    if f"\"{name}\")" in l:
        i += 3
        break
    content.append(l)
    i += 1
while i < length:
    l = lines[i]
    if "declare" in l:
        starter = l.index(name)-1
        l = l[:starter] + l[starter + len(name)+1:]
    content.append(l)
    i += 1
with open(CDTO_PATH, 'w') as f:
    for l in content:
        f.write(l)
