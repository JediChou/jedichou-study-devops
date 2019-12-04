
os   = ["win7", "win8", "win10"]
bit  = ["32bit", "64bit"]
func = ["login", "MsgSign", "PDFSign", "PDFSignList"]

testcases = [
	(x, y, z) 
	for x in os 
	for y in bit 
	for z in func
]

for x, y, z in testcases:
    print(x, y, z)
