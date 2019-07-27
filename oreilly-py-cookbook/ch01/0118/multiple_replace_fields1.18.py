#!/usr/bin/env python
'''
1.18一次完成多个替换
'''
#使用正则表达式进行替换
import re
def multiple_replace(text, adict):
    rx = re.compile('|'.join(map(re.escape, adict)))
    def one_xlat(match):
	return adict[match.group(0)]
    return rx.sub(one_xlat, text)
