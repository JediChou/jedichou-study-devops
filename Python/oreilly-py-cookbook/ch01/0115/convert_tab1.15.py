#!/usr/bin/env python
"""
1.15扩展和压缩制表符
"""
#将字符串中的制表符转化成一定数目的空格，或者反其道而行
#使用expandtabs方法可以解决问题,expandtabs不会改变mystring原先指向的字符串对象
#只不过将名字mystring绑定到新创建的修改过的字符串拷贝上
mystring = '\t\thello\t'
mystring = mystring.expandtabs()
print mystring

#将空格转成制表符，使用下面函数

def unexpand(astring, tablen=8):
    import re
    # 切分成空格和非空格的序列
    pieces = re.split(r'( +)', astring.expandtabs(tablen))
    #记录目前的字符串总长度
    lensofar = 0
    for i, piece in enumerate(pieces):
        thislen = len(piece)    
        lensofar += thislen    #不懂为什么要写这个，为什么不直接用thislen
        if piece.isspace():
	    #将各个空格序列改成 tabs+spaces
            numblanks = lensofar % tablen
            numtabs = (thislen-numblanks+tablen-1)/tablen #不懂为什么要这样算
            pieces[i] = 't'*numtabs + ' '*numblanks
    return ''.join(pieces)

astring = '           hello          '
print unexpand(astring, tablen=8)

#上面函数只适用于单行字符串，要处理多行字符串，用下语句
''.join([unexpand(s) for s in astring.splitlines(True)])

#如果只需要处理每行文本行首的空白符，无须理会其他制表符，使用下面函数就够了

def expand_at_linestart(P, tablen=8):
    import re
    def exp(mo):
        return mo.group().expandtabs(tablen)    #此处有疑问
    return '\n'.join([re.sub(r'^\s', exp, s) for s in P.splitlines(True)])
#测试

S = """
            helo how are you 
          Do you know
         good morning
    """
print expand_at_linestart(S, tablen=8)
