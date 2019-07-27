# coding: utf-8

import zipfile, re

rx_stripxml = re.compile("<[^>]*?>", re.DOTALL | re.MULTILINE)

def convert_oo(file, want_text=True):
    """ 将一个OpenOffice.org文件转换成XML或文本 """
    zf = zipfile.ZipFile(filename, "r")
    data = zf.read("content.xml")
    zf.close()
    if want_text:
        data = " ".join(rx_stripxml.sub(" ", data).split())
    return data
    
if __name__ == "__main__":
    """ TODO 需进行测试 """
    import sys
    if len(sys.argv) > 1:
        for docname in sys.argv[1:]:
            print 'Text of', docname, ':'
            print convert_oo(docname)
            print 'XML of', docname, ':'
            print convert_oo(docname, want_text=False)
    else:
        print 'Call with paths to oo.o doc files to see Text and XML forms.'