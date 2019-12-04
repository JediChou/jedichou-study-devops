count = 0
thefile = open('data', 'rb')
while True:
    buff = thefile.read(8192*1024)
    if not buff:
        break
    count += buff.count('\n')
thefile.close()

# TODO the result is wrong
print count