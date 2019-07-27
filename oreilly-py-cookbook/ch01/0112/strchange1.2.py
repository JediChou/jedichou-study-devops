#!/usr/bin/env python
# 将一个字符转化为相应的ASCII（ISO）或者Unicode码，或者反其道而行

print ord('a')

print chr(97)

print ord(u'\u2020')

print repr(unichr(8224))

print repr(chr(97))

print repr(str(97))

#把一个字符串转化为一个包含各个字符的值得列表

print map(ord, 'ciao')

print ''.join(map(chr, range(97, 100)))
