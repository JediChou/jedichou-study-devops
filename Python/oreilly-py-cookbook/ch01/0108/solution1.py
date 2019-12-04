# coding:utf-8

def containsAny(seq, aset):
	""" check whether sequence seq contains ANY of the item in aset. """
	for c in seq:
		if c in aset: return True
	return False

if __name__ == "__main__":
	print containsAny("abcd", "efgh")
	print containsAny([1,2,3,4], [5,6,7,8])
	print containsAny('e', 'efgh')
	print containsAny([5], [5,6,7,8])
