#!/usr/bin/env python
"""
1.14 改变多行文本字符串的缩进
"""
def reindent(s, numSpaces):
    leading_space = numSpaces * ' '
    lines = [leading_space + line.strip()
		for line in s.splitlines()]
    return '\n'.join(lines)


#使用上函数进行缩进

x = """	    line one
        line two
    and line three
    """
print reindent(x, 4)

