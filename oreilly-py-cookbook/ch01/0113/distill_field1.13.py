#!/usr/bin/env python
"""
1.13�������ַ���
"""
#����ַ����϶̿���ʹ����Ƭ����������ֶεĳ��ȣ���Ҫʹ��struct.unpack
theline = "I want you are very well do you know"
import struct
#�õ�һ��5�ֽڵ��ַ���������3�ֽڣ��õ�����8�ֽ��ַ������Լ����ಿ�֣�
baseformat = "5s 3x 8s 8s"
#theline�����ĳ���Ҳ�����base-formatȷ��
#���ڱ�������24�ֽڣ���struct.calcsize�Ǻ�ͨ�õģ�
numremain = len(theline) - struct.calcsize(baseformat)
#�ú��ʵ�s��x�ֶ���ɸ�ʽ��Ȼ��unpack
format = "%s %ds" % (baseformat, numremain)
l, s1, s2, t = struct.unpack(format, theline)

print l
print s1
print s2
print t

