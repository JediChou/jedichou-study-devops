#!/usr/bin/env python
'''
���ַ������ַ�����ʷ�ת����
'''
#ʹ��"����"Ϊ-1����Ƭ�������ɲ���һ����ȫ��ת��Ч��
astring = "dege dfge ssds"
revchars = astring[::-1]
print revchars

#���յ�������ת�ַ������ȳԴ���һ�������б�������б�ת����join����ϲ�
revwords = astring.split()
revwords.reverse()
revwords = ' '.join(revwords)
print revwords

#һ�н��
revwords1 = ' '.join(astring.split()[::-1])
print revwords1

#�������ʷ�ת����ͬʱ���ı�ԭ�ȵĿո񣬿�����������ʽ���ָ�ԭ�ַ���
import re
revwords2 = re.split(r'(\s+)', astring)
revwords2.reverse()
revwords2 = ''.join(revwords2)

#һ�н��
revwords3 = ''.join(re.split(r'(\s+)', astring) [::-1])
print revwords3

#��дһ�н����ʹ���ڽ�����reversed
revwords4 = ' '.join(reversed(astring.split()))
print revwords4
revwords5 = ''.join(reversed(re.split(r'(\s+)', astring)))
print revwords5
revchars = ''.join(reversed(astring))
print revchars
