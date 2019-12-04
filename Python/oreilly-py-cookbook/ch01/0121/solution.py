# -*- coding: utf-8 -*-

unicodestring = u"Hello world"

# 将Unicode转换为普通Python字符串: "encode"
utf8string = unicodestring.encode("utf-8"); print utf8string
asciistring = unicodestring.encode("ascii"); print asciistring
isostring = unicodestring.encode("ISO-8859-1"); print isostring
utf16string = unicodestring.encode("utf-16"); print utf16string

# 将普通Python字符串转化为Unicode: "decode"
plainstring1 = unicode(utf8string, "utf-8"); print plainstring1
plainstring2 = unicode(asciistring, "ascii"); print plainstring2
plainstring3 = unicode(isostring, "ISO-8859-1"); print plainstring3
plainstring4 = unicode(utf16string, "utf-16"); print plainstring4

# 作一个简单的断言
assert plainstring1 == plainstring2 == plainstring3 == plainstring4
