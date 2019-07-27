# If you need to reverse by words
# while preserving untouched the
# intermediate whitespace, you can
# split by a regular expression:

import re
astring = 'this is a test for split by regex'
revwords = re.split(r'(\s+)', astring)
revwords.reverse()
revwords = ''.join(revwords)
print revwords
