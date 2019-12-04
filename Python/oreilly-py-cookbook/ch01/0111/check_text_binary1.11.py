#!/usr/bin/env python
'''
1.11���һ���ַ������ı����Ƕ����ơ�����ַ����а����˿�ֵ���������г���30%
���ַ��ĸ�λ����1����ζ�Ÿ��ַ�����ֵ����126��������ֵĿ����룬���Ǿ���Ϊ��
�������Ƕ���������
'''

from __future__ import division
import string
text_characters = ''.join(map(chr, range(32, 127))) + "\n\r\t\b"
_null_trans = string.maketrans('', '')
def istext(s, text_characters=text_characters, threshold=0.30):
    #��s�����˿�ֵ���������ı�
    if "\0" in s:
        return False
    #һ�����ա��ַ����ǡ��ı���������һ�����۵��ֺ޺����ѡ��
    if not s:
        return True
    #���s���ɷ��ı��ַ����ɵ��Ӵ�
    t = s.translate(_null_trans, text_characters)
    #���������30%���ַ��Ƿ��ı��ַ���s���ַ���
    return len(t)/len(s) <= threshold
