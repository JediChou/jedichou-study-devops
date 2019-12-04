def containsAll(seq, aset):
	"""Check whether sequence seq contains All the items in aset."""
	return not set(aset).difference(seq)

if __name__ == "__main__":
	L1 = [1,2,3,3]
	L2 = [1,2,3,4]
	print set(L1).difference(L2)
	print set(L2).difference(L1)
	print containsAll(L1, L2)
	print containsAll(L2, L1)
