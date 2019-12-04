#!/usr/bin/env python

seq = "ajiihisere"
aset = "adijjioser"
def containsAny(seq, aset):
	for c in seq:
		if c in aset: return True
	return False

print containsAny(seq, aset)

import itertools
def containsAny1(seq, aset):
	for item in itertools.ifilter(aset.__contains__, seq):
		return True
	return False

print containsAny1(seq, aset)

def containsAny2(seq, aset):
	return bool(set(aset).intersection(seq))
print containsAny2(seq, aset)

def containsAll3(seq, aset):
	return not set(aset).difference(seq)
print containsAll3(seq, aset)

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
