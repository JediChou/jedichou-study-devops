#!/usr/bin/env python
"""
1.12���ƴ�Сд
"""
#��һ���ַ����ɴ�дת��Сд�����߷��������֮
little = 'addaSBFadd'
big = little.upper()
print big
little = big.lower()
print little

"""
s.capitalize��s[:1].upper()+s[1:].lower���ƣ���һ���ַ����ĳɴ�д�������ַ�ת��Сд��s.title�ǽ�ÿ�����ʵĵ�һ����ĸ��д
"""
print 'one tWo thrEe'.capitalize()
print 'one tWo thrEe'.title()

"""
��isupper��islower��istitle����������������ַ������ǿյģ����ٺ���һ����ĸ�����ҷֱ�����ȫ����д��ȫ��Сд��ÿ�����ʿ�ͷ��д�������������ַ������᷵��һ��True��û���ж�capitalize�ķ�������д���¡�
"""
import string
notrans = string.maketrans('', '') 
def containsAny(str, strset):
    return len(strset) != len(strset.translate(notrans, str))
def iscapitalized(s):
    return s == s.capitalize() and containsAny(s, string.letters)

s = ''
print iscapitalized(s)
