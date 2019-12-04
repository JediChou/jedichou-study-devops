#!/usr/bin/env python

from __future__ import division
import string

text_characters = ''.join(map(chr, range(32, 127))) + "\n\r\t\b"
_null_trans = string.maketrans('', '')

def istext(s, text_characters=text_characters, threshold=0.30):
    if "\0" in s:
        return False

    if not s:
        return True

    t = s.translate(_null_trans, text_characters)

    return len(t)/len(s) <= threshold
