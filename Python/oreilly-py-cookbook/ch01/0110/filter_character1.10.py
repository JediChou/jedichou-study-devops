#!/usr/bin/env python
'''
1.10�����ַ����в�����ָ�����ϵ��ַ�
'''
import string
#���������ַ��Ŀɸ��õ��ַ���������������Ϊ
#һ�������ָ�������뷭�롱
allchars = string.maketrans('', '')
def makefilter(keep):
    """����һ���������˷��غ�������һ���ַ���Ϊ����
        �������ַ�����һ�����ֿ������˿���ֻ������
        keep�е��ַ���ע��keep������һ����ͨ�ַ���
    """
    #����һ�������в���keep�е��ַ���ɵ��ַ�����keep��
    #������������������Ҫɾ�����ַ�
    delchars = allchars.translate(allchars, keep)
    #���ɲ�������Ҫ�Ĺ��˺�������Ϊ�հ���
    def thefilter(s):
        return s.translate(allchars, delchars)
    return thefilter
if __name__ == '__main__':
    just_vowels = makefilter('aeiouy')
    print just_vowels('four score and seven years ago')
    print just_vowels('tiger, tiger burning bright')
