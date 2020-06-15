import re
import os
from tqdm import tqdm

matches = []
with open("crackstation-human-only.txt", "r", encoding = "ISO-8859-1") as f:
    for line in f:
        x = re.findall("^[a-z]{1,8}$", line)
        if len(x) != 0:
            matches.append(line)

with open("passwords.txt", "w") as f:
    for match in tqdm(matches):
        f.write(match)
