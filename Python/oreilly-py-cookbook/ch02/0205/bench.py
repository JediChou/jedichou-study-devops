import time
import os

def timeo(fun, n=10):
    start = time.clock()
    for i in xrange(n): fun()
    stend = time.clock()
    thetime = stend - start
    return fun.__name__, thetime

#def linecount_w():
#    return int(os.popen('wc -l nuc').read().split()[0])
    
def linecount_1():
    return len(open('data').readlines())
    
def linecount_2():
    count = -1
    for count, line in enumerate(open('data')): pass
    return count + 1

def linecount_3():
    count = 0
    thefile = open('data', 'rb')
    while True:
        buff = thefile.read(65536)
        if not buff: break
        count += buff.count('\n')
    return count
    
if __name__ == "__main__":
    
    for f in linecount_1, linecount_2, linecount_3:
        print f.__name__, f()
        
    for f in linecount_1, linecount_2, linecount_3:
        print "%s: %.2f" % timeo(f)