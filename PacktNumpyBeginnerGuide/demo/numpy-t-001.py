from numpy import *

def defineArray1():
    a = arange(15).reshape(3,5)
    print a
    print a.shape
    print a.ndim
    print a.dtype.name
    print a.itemsize
    print a.size
    print type(a)

def defineArray2():
    b = array([6,7,8])
    print b
    print type(b)

def splitLine():
    print "-------------------------"

if __name__ == '__main__':
    defineArray1()
    splitLine()
    defineArray2()
