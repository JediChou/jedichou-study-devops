''' leecode-findnum.py '''

def printSum(num):
	rs, t = '' , 0
	for c in str(num):
		 rs += ("%s+") % c
		 t += int(c)
	print "%s = %d" % (rs, t)

if __name__ == '__main__':
	import sys
	
	num, times = int(sys.argv[1]), 0
	while (num > 10):
		printSum(num)
		num = sum([int(x) for x in str(num)])
		times += 1

	print "calculate times: %s " % times
