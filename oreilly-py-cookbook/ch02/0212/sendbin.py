"""
From: Python Cookbook ZhCN
Thanks for Hamish Lawson
"""

import sys
if __name__ == '__main__':

	data = "\n".join("Jedi chou")
	response = "Content-Type: text/plain\n"
	response += "Content-Length: %d\n\n" % len(data)
	response += data

	if sys.platform == 'win32':
		import os, msvcrt
		msvcrt.setmode(sys.stdout.fileno(), os.O_BINARY)
	sys.stdout.write(response)

