# coding: utf-8
# File: PyTricks-20191219-t2.py
# From: Dan at Real Python
# Mail title: [PyTricks]: Merging two dicts in Python 3.5+ with a single expression

if __name__ == '__main__':
	"""In Python 2.x you could"""
	x = {'a': 1, 'b': 2 }
	y = {'c': 3, 'd': 4 }
	m = dict(x, **y)
	print m
