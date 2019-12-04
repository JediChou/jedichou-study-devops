#!/usr/bin/env python

## File name: stack.py
## Time: 2010-11-23
## Description: use python to other data struct.

stack = []

def pushit():
	stack.append(raw_input('Enter new string: ').strip())
	
def popit():
	if( len(stack) == 0):
		print 'Cannot pop from an empty stack!'
	else:
		print 'Removed [', 'stack.pop()', ']'

def viewstack():
	print stack # calls str() internally
	
CMDs = {'u':pushit, 'o':popit, 'v':viewstack}

def showmenu():
	pr = """
	p(U)sh
	