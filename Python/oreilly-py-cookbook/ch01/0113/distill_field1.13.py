#!/usr/bin/env python
"""
1.13访问子字符串
"""
#如果字符串较短可以使用切片，如果考虑字段的长度，需要使用struct.unpack
theline = "I want you are very well do you know"
import struct
#得到一个5字节的字符串，跳过3字节，得到两个8字节字符串，以及其余部分：
baseformat = "5s 3x 8s 8s"
#theline超出的长度也由这个base-format确定
#（在本例中是24字节，但struct.calcsize是很通用的）
numremain = len(theline) - struct.calcsize(baseformat)
#用合适的s或x字段完成格式，然后unpack
format = "%s %ds" % (baseformat, numremain)
l, s1, s2, t = struct.unpack(format, theline)

print l
print s1
print s2
print t

