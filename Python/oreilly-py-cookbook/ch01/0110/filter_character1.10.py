#!/usr/bin/env python
'''
1.10过滤字符串中不属于指定集合的字符
'''
import string
#生成所有字符的可复用的字符串，它还可以作为
#一个翻译表，指明“无须翻译”
allchars = string.maketrans('', '')
def makefilter(keep):
    """返回一个函数，此返回函数接受一个字符串为参数
        并返回字符串的一个部分拷贝，此拷贝只包含在
        keep中的字符，注意keep必须是一个普通字符串
    """
    #生成一个由所有不在keep中的字符组成的字符串：keep的
    #补集，即所有我们需要删除的字符
    delchars = allchars.translate(allchars, keep)
    #生成并返回需要的过滤函数（作为闭包）
    def thefilter(s):
        return s.translate(allchars, delchars)
    return thefilter
if __name__ == '__main__':
    just_vowels = makefilter('aeiouy')
    print just_vowels('four score and seven years ago')
    print just_vowels('tiger, tiger burning bright')
