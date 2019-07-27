#!/usr/bin/env python
#使用sets.Set,获得字符串的所有字符的集合

import sets
magic_chars = sets.Set('abracadabra')
poppins_chars = sets.Set('supercalifragilisticexpialidocious')
print ''.join(magic_chars & poppins_chars)
