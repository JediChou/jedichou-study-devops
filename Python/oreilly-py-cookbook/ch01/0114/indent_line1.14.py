#!/usr/bin/env python
"""
1.14 �ı�����ı��ַ���������
"""
def reindent(s, numSpaces):
    leading_space = numSpaces * ' '
    lines = [leading_space + line.strip()
		for line in s.splitlines()]
    return '\n'.join(lines)


#ʹ���Ϻ�����������

x = """	    line one
        line two
    and line three
    """
print reindent(x, 4)

