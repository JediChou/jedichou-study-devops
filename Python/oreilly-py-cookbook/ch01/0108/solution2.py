# coding:utf-8
import itertools

def containsAny(seq, aset):
	""" Jedi: effective, but not clear"""
	for item in itertools.ifilter(aset.__contains__,seq):
		return True
	return False

if __name__ == "__main__":
	print containsAny("abcd", "efgh")
	print containsAny([1,2,3,4], [5,6,7,8])
	print containsAny('e', 'efgh')
	print containsAny([5], [5,6,7,8])
