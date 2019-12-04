#!/usr/bin/env python

astring = "dege dfge ssds"
revchars = astring[::-1]
print revchars

revwords = astring.split()
revwords.reverse()
revwords = ' '.join(revwords)
print revwords

revwords1 = ' '.join(astring.split()[::-1])
print revwords1

import re
revwords2 = re.split(r'(\s+)', astring)
revwords2.reverse()
revwords2 = ''.join(revwords2)

revwords3 = ''.join(re.split(r'(\s+)', astring) [::-1])
print revwords3

revwords4 = ' '.join(reversed(astring.split()))
print revwords4
revwords5 = ''.join(reversed(re.split(r'(\s+)', astring)))
print revwords5
revchars = ''.join(reversed(astring))
print revchars
