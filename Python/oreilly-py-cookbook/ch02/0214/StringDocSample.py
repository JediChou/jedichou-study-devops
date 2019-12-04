# coding: utf-8
import StringIO

if __name__ == "__main__":
	
	output = StringIO.StringIO()
	output.write("First line.\n")
	print >>output, "Second line."

	contents = output.getvalue()
	print contents

	output.close()
