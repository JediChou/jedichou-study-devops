#!/usr/bin/env python
'''
��С�ַ����ϲ��ɴ��ַ���
'''
import operator

pieces = "jfidhijf  ddjifdhih dhfidhfi  dhfidhidfhidh"

largeString = ''.join(pieces)
print largeString

largeString1 = '%s%s something %s yet more' % ('small1', 'small2', 'small3')
print largeString1

largeString2 = 'small' + 'small2' + ' something ' + 'small3' + ' yet more'
print largeString2

largeString3 = ''
for piece in pieces:
	largeString3 += piece
print largeString3

largeString4 = reduce(operator.add, pieces, '')
print largeString4
