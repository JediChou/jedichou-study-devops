#!/usr/bin/env python

little = 'addaSBFadd'
big = little.upper()
print big
little = big.lower()
print little

print 'one tWo thrEe'.capitalize()
print 'one tWo thrEe'.title()

import string
notrans = string.maketrans('', '') 

def containsAny(str, strset):
    return len(strset) != len(strset.translate(notrans, str))

def iscapitalized(s):
    return s == s.capitalize() and containsAny(s, string.letters)

s = ''
print iscapitalized(s)
