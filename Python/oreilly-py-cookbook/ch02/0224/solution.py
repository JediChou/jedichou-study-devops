# coding: utf-8

import CoreGraphics

def pageCount(pdfPath):
    """ 返回指定路径的PDF文档页数 """
    pdf = CoreGraphics.CGPDFDocumentCreateWithProvider(
        CoreGraphics.CGPDFDocumentCreateWithFilename(pdfPath)
    )
    return pdf.getNumberOfPages()
    
if __name__ == "__main__":
    """ TODO 需进行测试 """
    import sys
    for path in sys.argv[1:]:
        print pageCount(path)