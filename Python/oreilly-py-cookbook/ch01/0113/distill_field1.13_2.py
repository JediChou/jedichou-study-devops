#!/usr/bin/env python
"""
1.13_2访问子字符串, 使用生成器，封装成函数
"""

def split_at(the_line, cuts, lastfield=False):
    last = 0
    for cut in cuts:
        yield the_line[last:cut]
        last = cut
    if lastfield:
        yield the_line[last:]
def split_by(the_line, n, lastfield=False):
    return split_at(the_line, xrange(n, len(the_line), n), lastfield)

#调用函数，使用列表保存结果
the_line = "I want you are a very beautiful girl!"
list_of_fields = list(split_by(the_line, 5))
print list_of_fields
