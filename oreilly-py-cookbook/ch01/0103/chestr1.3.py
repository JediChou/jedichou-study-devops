#!/usr/bin/env python
'''
测试一个对象是否是类字符串，利用内建的isinstance 和 basestring 来简单
快速的检查某个对象是否是字符串或者Unicode对象的方法。
'''
def isAString(anobj):
	return isinstance(anobj, basestring)

print isAString('ahsdhfua')
