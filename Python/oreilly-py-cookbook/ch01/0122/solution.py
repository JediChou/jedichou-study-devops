# -*- coding: utf-8 -*-

import codecs, sys
old = sys.stdout
char = u"\N{LATIN SMALL LETTER A WITH DIAERESIS}"

sys.stdout = codecs.lookup('iso8859-1')[-1](sys.stdout)
print char

# sys.stdout = codecs.lookup('utf-8')[-1](sys.stdout)
# print char