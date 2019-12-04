#!/bin/python
# -*- coding: utf-8 -*-

from numpy import *

def GetDataTypeObjects():
	a = array([1,2])
	print a.dtype.itemsize

def UseCharacterCode1():
	print arange(7, dtype='f')

def UseCharacterCode2():
	print arange(7, dtype='D')

def UseCharacterCodeOther():
	print arange(7, dtype='i')
	# print arange(7, dtype='v')	# python-xy + win10 -> run error
	# print arange(7, dtype='U')	# python-xy + win10 -> run error
	# print arange(7, dtype='S')	# python-xy + win10 -> run error
	print arange(7, dtype='b')
	print arange(7, dtype='d')
	print arange(7, dtype='f')
	# print arange(7, dtype='u')	# python-xy + win10 -> run error

if __name__ == '__main__':
	"""
	  NumPy Beginners Guider Third Edition, Page 33
	  Date type objects & Character codes
	  Jedi Chou (skyzhx@163.com), 2017-9-6
	"""
	GetDataTypeObjects()
	UseCharacterCode1()
	UseCharacterCode2()
	UseCharacterCodeOther()