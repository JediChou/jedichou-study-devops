#!/usr/bin/env python
"""
1.14_1 �ı�����ı��ַ���������
"""
#����ÿ�����׵Ŀո�������ȷ�������ı�����֮�����������������仯��
#���������Ҫ���һ��ÿ�����׵Ŀո���ȷ������ѷǿո��ַ���ȥ��

def addSpaces(s, numAdd):
    white = " "*numAdd
    return white + white.join(s.splitlines(True))
def numSpaces(s):
    return [len(line)-len(line.lstrip()) for line in s.splitlines()]
def delSpaces(s, numDel):
    if numDel > min(numSpaces(s)):
        raise ValueError, "removing more spaces than there are!"
    return '\n'.join([ line[numDel:] for line in s.splitlines() ])

#���ָ���֮�������������䣬ֻɾ���ܹ�ɾ���Ŀո���������С������
#��߽���롣
def unIndentBlock(s):
    return delSpaces(s, min(numSpaces(s)))
