# coding: utf-8
import StringIO

if __name__ == "__main__":
	
	output = StringIO.StringIO()
	output.write("First line.\n")
	print >>output, "Second line."

	# ��getvalueȡֵ
	contents = output.getvalue()
	print contents

	# �رն���, �ͷŻ���
	output.close()
