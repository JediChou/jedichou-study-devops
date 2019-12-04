#!/usr/bin/env python

mystring = '\t\thello\t'
mystring = mystring.expandtabs()
print mystring

def unexpand(astring, tablen=8):
    import re
    pieces = re.split(r'( +)', astring.expandtabs(tablen))
    lensofar = 0
    for i, piece in enumerate(pieces):
        thislen = len(piece)    
        lensofar += thislen
        if piece.isspace():
            numblanks = lensofar % tablen
            numtabs = (thislen-numblanks+tablen-1)/tablen
            pieces[i] = 't'*numtabs + ' '*numblanks
    return ''.join(pieces)

astring = '           hello          '
print unexpand(astring, tablen=8)

''.join([unexpand(s) for s in astring.splitlines(True)])

def expand_at_linestart(P, tablen=8):
    import re
    def exp(mo):
        return mo.group().expandtabs(tablen)
    return '\n'.join([re.sub(r'^\s', exp, s) for s in P.splitlines(True)])

S = """
            helo how are you 
          Do you know
         good morning
    """
print expand_at_linestart(S, tablen=8)
