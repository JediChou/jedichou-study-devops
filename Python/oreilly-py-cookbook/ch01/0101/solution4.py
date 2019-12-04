# -*- coding:utf-8 -
"""
  map function prototype:
    map(function, iterable, ...) 
  
  Jedi: map(处理函数, 可迭代的对象)
  Jedi: 用来进行可迭代数据对象的处理
  Jedi: Python中大量使用这类东西
"""

results = map(lambda x:"0x"+x, "hello python")
print results