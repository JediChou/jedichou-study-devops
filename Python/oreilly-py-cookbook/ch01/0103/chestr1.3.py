#!/usr/bin/env python
'''
����һ�������Ƿ������ַ����������ڽ���isinstance �� basestring ����
���ٵļ��ĳ�������Ƿ����ַ�������Unicode����ķ�����
'''
def isAString(anobj):
	return isinstance(anobj, basestring)

print isAString('ahsdhfua')
