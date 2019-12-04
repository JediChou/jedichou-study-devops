#!/usr/bin/env python
"""
1.12控制大小写
"""
#将一个字符串由大写转成小写，或者反其道而行之
little = 'addaSBFadd'
big = little.upper()
print big
little = big.lower()
print little

"""
s.capitalize和s[:1].upper()+s[1:].lower相似：第一个字符被改成大写，其余字符转成小写。s.title是将每个单词的第一个字母大写
"""
print 'one tWo thrEe'.capitalize()
print 'one tWo thrEe'.title()

"""
有isupper、islower和istitle方法，如果给定的字符串不是空的，至少含有一个字母，而且分别满足全部大写、全部小写、每个单词开头大写的条件，这三种方法都会返回一个True。没有判定capitalize的方法，编写如下。
"""
import string
notrans = string.maketrans('', '') 
def containsAny(str, strset):
    return len(strset) != len(strset.translate(notrans, str))
def iscapitalized(s):
    return s == s.capitalize() and containsAny(s, string.letters)

s = ''
print iscapitalized(s)
