#!/bin/python
# -*- coding: utf-8 -*-

from numpy import *

def BasicOutput():
	print finfo(float16)
	print float64(42)
	print int8(42.0)
	print bool(42)
	print float(True)
	print float(False)

def OtherFormatOutput():
	varange = arange(7, dtype=uint16)
	print varange

if __name__ == '__main__':
	"""
	  NumPy Beginner Guide Third Edition
	  Page 32
	  Title: NumPy numerical types
	"""
	BasicOutput()
	OtherFormatOutput()