# coding: utf-8

import sys, os

class Error(Exception): pass

def _find(pathnanme, matchFunc=os.path.isfile):
    for dirname in sys.path:
        candidate = os.path.join(dirname, pathname)
        if matchFunc(candidate):
            return candidate
    raise Error("can't find file %s" % pathname)
    
def findFile(pathname):
    return _find(pathname)
    
def findDir(path):
    return _find(path, matchFunc=os.path.isdir)