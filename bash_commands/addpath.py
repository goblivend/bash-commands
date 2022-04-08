import sys
import os

# print('cmd entry:', sys.argv)

path = sys.argv[1]
name = sys.argv[2]
CDTO_PATH = sys.argv[3]

if not os.path.exists(path):
    raise Exception('The path of the .bash.sh file is wrong :', path)
content = []
with open(CDTO_PATH, 'r') as f:
    lines = f.readlines()
length = len(lines)
i = 0
while i < length:
    l = lines[i]
    if "*)" in l:
        content.append(f"\t\t\t\"{name}\")\n")
        content.append(f"\t\t\t\tcd \"{path}\"\n")
        content.append(f"\t\t\t\t;;\n")
        break
    content.append(l)
    i += 1
while i < length:
    l = lines[i]
    if "declare" in l:
        line = ""
        for c in l:
            if c == ')':
                line += " " + name
            line += c
        l = line
    content.append(l)
    i += 1
with open(CDTO_PATH, 'w') as f:
    for l in content:
        f.write(l)
