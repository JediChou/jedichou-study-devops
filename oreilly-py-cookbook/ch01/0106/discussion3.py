# coding:utf-8
# cooler than discussion2.py
import operator
pieces = ['hello', 'python', 'and', 'world']
largeString = reduce(operator.add, pieces, " ")
print largeString
