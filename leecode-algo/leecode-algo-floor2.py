""" define variable """
floorData = '1111111112222233333333334444'
dict = {}

""" process """
for flr in floorData:
	if flr in dict.keys(): dict[flr] += 1
	else: dict[flr] = 1
	
""" 