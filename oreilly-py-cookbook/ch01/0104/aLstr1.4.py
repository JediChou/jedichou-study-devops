#!/usr/bin/env python
'''
实现字符串对齐：左对齐，居中对齐，或者右对齐。string对象的ljust、rjust
和center方法可以解决问题.每个方法都需要一个参数，指出生成字符串的宽度，之后
返回一个在左端、右端、或者两端都添加了空格的字符串拷贝。
'''

print '|', 'hej'.ljust(20), '|', 'hej'.rjust(20), '|', 'hej'.center(20), '|'

print 'hej'.center(20, '+')
