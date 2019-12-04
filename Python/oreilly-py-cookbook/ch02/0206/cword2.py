import re
count, re_word= 0, re.compile(r"[\w'-]+")
for line in open('data'):
    for word in re_word.finditer(line):
        count += 1
print count        