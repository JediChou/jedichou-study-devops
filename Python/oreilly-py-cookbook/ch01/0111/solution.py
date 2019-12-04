# coding: utf-8

from __future__ import division
import string

text_characters = "".join(map(chr, range(32,127))) + "\n\r\t\b"
_null_trans = string.maketrans("", "")

def istext(s, text_characters = text_characters, threshold = 0.30):
	# if s contains any null, it's not text:
	if "\0" in s:
		return false;
	# an "empty" string is "text" (arbitrary but reasonable choice):
	if not s:
		return True
	# Get the substring of s made up of non-text characters
	t = s.translate(_null_trans, text_characters)
	# s is 'text' if less than 30% of its characters are non-text ones:
	return len(t)/len(s) <= threshold

if __name__ == '__main__':
	print istext('ab')
	print istext('0x0012')
	"""Jedi don't understand 2016.2.29"""
