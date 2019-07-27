# coding: utf-8

import fnmatch, os, sys, win32com.client

# TODO 需进行测试

wordapp = win32com.client.gencache.EnsureDispatch("Word.Application")
try:
    for path, dirs, files in os.walk(sys.argv[1]):
        if not fnmatch.fnmatch(filename, '*.doc'): continue
        doc = os.path.abspath(os.path.join(path, filename))
        print "processing %s" % doc
        wordapp.Documents.Open(doc)
        docastxt = doc[:-3] + 'txt'
        wordapp.ActiveDocument.SaveAs(
            FileFormat=win32com.client.constants.wdFormatText
        )
        wordapp.ActiveDocument.Close()
finally:
    wordapp.Quit()