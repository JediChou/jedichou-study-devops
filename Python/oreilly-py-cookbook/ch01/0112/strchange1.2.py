#!/usr/bin/env python
# ��һ���ַ�ת��Ϊ��Ӧ��ASCII��ISO������Unicode�룬���߷��������

print ord('a')

print chr(97)

print ord(u'\u2020')

print repr(unichr(8224))

print repr(chr(97))

print repr(str(97))

#��һ���ַ���ת��Ϊһ�����������ַ���ֵ���б�

print map(ord, 'ciao')

print ''.join(map(chr, range(97, 100)))
