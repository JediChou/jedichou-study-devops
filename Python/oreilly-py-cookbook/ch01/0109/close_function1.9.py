#!/usr/bin/env python
'''
1.9简化字符串的translate方法的使用，使用返回闭包的工厂函数完成这种任务
'''
import string
def translator(frm='', to='', delete='', keep=None):
    if len(to) == 1:
        to = to * len(frm)
    trans = string.maketrans(frm, to)
    if keep is not None:
        allchars = string.maketrans('', '')
        delete = allchars.translate(allchars, keep.translate(allchars,
delete))
    def translate(s):
        return s.translate(trans, delete)
    return translate
   

#使用工厂函数,选出属于指定集合的字符
digits_only = translator(keep=string.digits)
print digits_only('Chris Perkins : 224-7992')

#使用工厂函数移除属于某字符集合的元素
no_digits = translator(delete=string.digits)
print no_digits('Chris Perkins : 224-7992')

#使用工厂函数实现用某个字符替换属于某指定集合的字符
digits_to_hash = translator(frm=string.digits, to='#')
print digits_to_hash('Chris Perkins : 224-7992')

