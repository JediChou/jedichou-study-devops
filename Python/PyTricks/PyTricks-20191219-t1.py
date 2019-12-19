# coding: utf-8
# File: PyTricks-20191219-t1.py
# From: Dan at Real Python
# Mail title: [PyTricks]: Merging two dicts in Python 3.5+ with a single expression

if __name__ == '__main__':
	"""Merging two dicts in Python 3.5+ with a single expression"""
	x = {'a': 1, 'b': 2 }
	y = {'c': 3, 'd': 4 }
	m = {**x, **y}
	print(m)
