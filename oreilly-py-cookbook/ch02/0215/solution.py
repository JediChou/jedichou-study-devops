# coding: utf-8
import types, tempfile
CHUNK_SIZE = 16 * 1024

def adapt_file(fileobj):
	if isinstance(fileobj, file): return fileobj
	tempFileObj = tempfile.TemporaryFile
	while True:
		data = fileobj.read(CHUNK_SIZE)
		if not data: break
		tempFileObj.write(data)
	fileobj.close()
	tempFileObj.seek(0)
	return tempFileObj

# TODO, need write a main method
