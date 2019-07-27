#!/usr/bin/env python
'''
把字符串逐字符或逐词反转过来
'''
#使用"步长"为-1的切片方法，可产生一个完全反转的效果
astring = "dege dfge ssds"
revchars = astring[::-1]
print revchars

#按照单词来反转字符串，先吃创建一个单词列表，将这个列表反转，用join将其合并
revwords = astring.split()
revwords.reverse()
revwords = ' '.join(revwords)
print revwords

#一行解决
revwords1 = ' '.join(astring.split()[::-1])
print revwords1

#如果想逐词反转但又同时不改变原先的空格，可以用正则表达式来分割原字符串
import re
revwords2 = re.split(r'(\s+)', astring)
revwords2.reverse()
revwords2 = ''.join(revwords2)

#一行解决
revwords3 = ''.join(re.split(r'(\s+)', astring) [::-1])
print revwords3

#改写一行解决，使用内建函数reversed
revwords4 = ' '.join(reversed(astring.split()))
print revwords4
revwords5 = ''.join(reversed(re.split(r'(\s+)', astring)))
print revwords5
revchars = ''.join(reversed(astring))
print revchars
