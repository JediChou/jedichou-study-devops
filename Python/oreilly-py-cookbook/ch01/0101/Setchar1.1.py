#!/usr/bin/env python
#ʹ��sets.Set,����ַ����������ַ��ļ���

import sets
magic_chars = sets.Set('abracadabra')
poppins_chars = sets.Set('supercalifragilisticexpialidocious')
print ''.join(magic_chars & poppins_chars)
