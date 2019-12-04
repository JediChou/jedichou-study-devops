# coding: utf-8
import StringIO

if __name__ == "__main__":
	
	output = StringIO.StringIO()
	output.write("First line.\n")
	print >>output, "Second line."

	# 用getvalue取值
	contents = output.getvalue()
	print contents

	# 关闭对象, 释放缓冲
	output.close()
