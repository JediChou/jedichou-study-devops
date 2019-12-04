# -*- coding: utf-8 -*-

class iStr(str):
    """
    大小写不敏感的字符串类
    行为方式类似于str, 只是所有的比较和查询
    都是大小写不敏感的
    """
    
    def __init__(self, *args):
        self._lowered = str.lower(self)
    
    def __repr__(self):
        return '%s(%s)' % (type(self).__name__, str.__repr__(self))
        
    def __hash__(self):
        return hash(self._lowered)
        
    def lower(self):
        return self._lowered
        
def _make_case_insensitive(name):
    '''将str的方法封装成iStr的方法, 大小写不敏感'''
    
    str_meth = getattr(str, name)
    
    def x(self, other, *args):
        '''先尝试将other小写化，通常这应该是一个字符串，
           但必须要做好准备对这个过程中出现的错误，
           因为字符串是可以和非字符串正确地比较的
        '''
        try: other = other.lower()
        except (TypeError, AttributeError, ValueError): pass
        return str_meth(self._lowered, other, *args)
    setattr(iStr, name, x)
    
# 将_make_case_insensitive函数应用于指定的方法
for name in 'eq lt le gt gt ne contains'.split():
    _make_case_insensitive('__%s__' % name)

for name in 'count endswith find index rfind rindex startswith'.split():
    _make_case_insensitive(name)
    
# 注意，我们并不修改replace、split、strip等方法
# 当然，如果有需要，也可以对它们进行修改
del _make_case_insensitive  # 删除帮助函数，已经不再需要了