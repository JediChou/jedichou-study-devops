#!/usr/bin/env python

theline = "I want you are very well do you know"

import struct
baseformat = "5s 3x 8s 8s"
numremain = len(theline) - struct.calcsize(baseformat)
format = "%s %ds" % (baseformat, numremain)
l, s1, s2, t = struct.unpack(format, theline)

print l
print s1
print s2
print t
