#coding=utf-8

"""
  Jedi: Set是一种数据结构
  Jedi: Set中的元素不能重复
  Jedi: Set & Set 的操作符被重载，为取交集操作
"""

import sets

magic_chars   = sets.Set("abracadabra")
poppins_chars = sets.Set("supercalifd")
print "magic_chars     : " + str(magic_chars)
print "poppins_chars   : " + str(poppins_chars)
print "set intersection: " + "".join(magic_chars & poppins_chars)