#!/usr/bin/env python
"""
1.15��չ��ѹ���Ʊ��
"""
#���ַ����е��Ʊ��ת����һ����Ŀ�Ŀո񣬻��߷��������
#ʹ��expandtabs�������Խ������,expandtabs����ı�mystringԭ��ָ����ַ�������
#ֻ����������mystring�󶨵��´������޸Ĺ����ַ���������
mystring = '\t\thello\t'
mystring = mystring.expandtabs()
print mystring

#���ո�ת���Ʊ����ʹ�����溯��

def unexpand(astring, tablen=8):
    import re
    # �зֳɿո�ͷǿո������
    pieces = re.split(r'( +)', astring.expandtabs(tablen))
    #��¼Ŀǰ���ַ����ܳ���
    lensofar = 0
    for i, piece in enumerate(pieces):
        thislen = len(piece)    
        lensofar += thislen    #����ΪʲôҪд�����Ϊʲô��ֱ����thislen
        if piece.isspace():
	    #�������ո����иĳ� tabs+spaces
            numblanks = lensofar % tablen
            numtabs = (thislen-numblanks+tablen-1)/tablen #����ΪʲôҪ������
            pieces[i] = 't'*numtabs + ' '*numblanks
    return ''.join(pieces)

astring = '           hello          '
print unexpand(astring, tablen=8)

#���溯��ֻ�����ڵ����ַ�����Ҫ��������ַ������������
''.join([unexpand(s) for s in astring.splitlines(True)])

#���ֻ��Ҫ����ÿ���ı����׵Ŀհ׷���������������Ʊ����ʹ�����溯���͹���

def expand_at_linestart(P, tablen=8):
    import re
    def exp(mo):
        return mo.group().expandtabs(tablen)    #�˴�������
    return '\n'.join([re.sub(r'^\s', exp, s) for s in P.splitlines(True)])
#����

S = """
            helo how are you 
          Do you know
         good morning
    """
print expand_at_linestart(S, tablen=8)
