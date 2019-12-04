# coding: utf-8
import cStringIO

if __name__ == "__main__":

	"""
		Ref : https://docs.python.org/2/library/stringio.html
		Desc: cStringIO-Faster version of StringIO
		Jedi: cStringIO应该是用C重写了StringIO, 速度更快
	"""

	output = cStringIO.StringIO()
	output.write("First line.\n")
	print >>output, "Second line.\n"

	contents = output.getvalue()
	print contents

	output.close()
