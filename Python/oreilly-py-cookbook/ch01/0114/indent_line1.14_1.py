#!/usr/bin/env python
"""
1.14_1 改变多行文本字符串的缩进
"""
#调整每行行首的空格数，并确保整块文本的行之间的相对缩进不发生变化。
#反向调整需要检查一下每行行首的空格，以确保不会把非空格字符截去。

def addSpaces(s, numAdd):
    white = " "*numAdd
    return white + white.join(s.splitlines(True))
def numSpaces(s):
    return [len(line)-len(line.lstrip()) for line in s.splitlines()]
def delSpaces(s, numDel):
    if numDel > min(numSpaces(s)):
        raise ValueError, "removing more spaces than there are!"
    return '\n'.join([ line[numDel:] for line in s.splitlines() ])

#保持各行之间的相对缩进不变，只删除能够删除的空格，让缩进最小的行与
#左边界对齐。
def unIndentBlock(s):
    return delSpaces(s, min(numSpaces(s)))
