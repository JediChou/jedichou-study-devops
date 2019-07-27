#!/usr/bin/env python
'''
1.8检查字符串中是否出现了某字符集合中的字符
'''
seq = "ajiihisere"
aset = "adijjioser"
def containsAny(seq, aset):
	"""检查序列seq是否含有aset中的项"""
	for c in seq:
		if c in aset: return True
	return False

print containsAny(seq, aset)

"""使用更高级和更复杂的基于标准库itertools模块的方法来提高性能"""
import itertools
def containsAny1(seq, aset):
	for item in itertools.ifilter(aset.__contains__, seq):
		return True
	return False

print containsAny1(seq, aset)

#一个纯粹基于集合的方法
def containsAny2(seq, aset):
	return bool(set(aset).intersection(seq))
print containsAny2(seq, aset)

#必须检查所有的子项的，使用内建的set类型
def containsAll3(seq, aset):
	"""检查序列seq是否含有aset的所有的项"""
	return not set(aset).difference(seq)
print containsAll3(seq, aset)
"""
处理seq和aset中的字符串（非 Unicode），可以使用特殊的方式，基于字符串的方法
translate和Python标准库中的string.maketrans
"""
import string
astr = "I know you"
strset = "I want you"
notrans = string.maketrans('', '')  #identity "translation"
def containsAny4(astr, strset):
	return len(strset) != len(strset.translate(notrans, astr))
print containsAny4(astr, strset)

def containsAll5(astr, strset):
	return not strset.translate(notrans, astr)
print containsAll5(astr, strset)
