# coding: utf-8

if __name__ == "__main__":
    import os, sys
    platform = sys.platform
    currPath = sys.path
    
    print "Current platform : %s" % platform
    print "Current path env variables:"
    for x in currPath:
        print x
    