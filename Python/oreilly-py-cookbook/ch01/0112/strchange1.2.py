#!/usr/bin/env python

print ord('a')
print chr(97)
print ord(u'\u2020')
print repr(unichr(8224))
print repr(chr(97))
print repr(str(97))
print map(ord, 'ciao')
print ''.join(map(chr, range(97, 100)))
