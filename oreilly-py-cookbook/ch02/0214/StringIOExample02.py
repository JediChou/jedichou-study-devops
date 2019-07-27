# coding: utf-8
import string
import StringIO

if __name__ == "__main__":

	s = StringIO.StringIO()
	s.write("Sarah,")
	lines = ["Miki,", "Sara,"]
	s.writelines(lines)

	s.seek(0)
	print s.read()
	print s.getvalue()

	s.write("Jesica")
	s.seek(0)
	print s.readlines()
	print s.len
