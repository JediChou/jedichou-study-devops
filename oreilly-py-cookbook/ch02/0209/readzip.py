import zipfile
z = zipfile.ZipFile("0209.zip", "r")
for filename in z.namelist():
	print 'File:', filename
	bytes = z.read(filename)
	print 'has', len(bytes), 'bytes'
