# coding: utf-8
import string, os, sys
import StringIO

def writedata(fd, msg):
	fd.write(msg)

if __name__ == "__main__":
	
	f = open('sample', 'w')
	writedata(f, "My company is foxconn")
	f.close

	s = StringIO.StringIO()
	writedata(s, "My company is foxconn")
	print s.getvalue()
