# coding:utf-8
def containsOnly(seq, aset):
	""" check whether sequence seq contains ONLY items in aset. """
	for c in seq:
		if c not in aset: return False
	return True

if __name__ == "__main__":
	print containsOnly("abcd", "efgh")
	print containsOnly([1,2,3,4], [5,6,7,8])
	print containsOnly('e', 'efgh')
	print containsOnly([5], [5,6,7,8])
