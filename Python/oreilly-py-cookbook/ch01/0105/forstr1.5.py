#!/usr/bin/env python

x = '  hej  '
print '|', x.lstrip(), '|', x.rstrip(), '|', x.strip(), '|'

y = 'xyxxyy hejyx yyx'
print '|'+x.strip('xy')+'|'
