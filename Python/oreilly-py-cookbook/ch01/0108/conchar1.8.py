#!/usr/bin/env python
'''
1.8����ַ������Ƿ������ĳ�ַ������е��ַ�
'''
seq = "ajiihisere"
aset = "adijjioser"
def containsAny(seq, aset):
	"""�������seq�Ƿ���aset�е���"""
	for c in seq:
		if c in aset: return True
	return False

print containsAny(seq, aset)

"""ʹ�ø��߼��͸����ӵĻ��ڱ�׼��itertoolsģ��ķ������������"""
import itertools
def containsAny1(seq, aset):
	for item in itertools.ifilter(aset.__contains__, seq):
		return True
	return False

print containsAny1(seq, aset)

#һ��������ڼ��ϵķ���
def containsAny2(seq, aset):
	return bool(set(aset).intersection(seq))
print containsAny2(seq, aset)

#���������е�����ģ�ʹ���ڽ���set����
def containsAll3(seq, aset):
	"""�������seq�Ƿ���aset�����е���"""
	return not set(aset).difference(seq)
print containsAll3(seq, aset)
"""
����seq��aset�е��ַ������� Unicode��������ʹ������ķ�ʽ�������ַ����ķ���
translate��Python��׼���е�string.maketrans
"""
import string
astr = "I know you"
strset = "I want you"
notrans = string.maketrans('', '')  #identity "translation"
def containsAny4(astr, strset):
	return len(strset) != len(strset.translate(notrans, astr))
print containsAny4(astr, strset)

def containsAll5(astr, strset):
	return not strset.translate(notrans, astr)
print containsAll5(astr, strset)
