count = 0
for line in open('data'):
    for word in line.split():
        count += 1
print count