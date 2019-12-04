#coding=utf-8
import urllib
import re

def getHtml(url):
    page = urllib.urlopen(url)
    html = page.read()
    return html

def getImg(html):
    reg = r'src="(.+?\.jpg)"'
    imgre = re.compile(reg)
    imglist = re.findall(imgre, html)
    return imglist

if __name__ == "__main__":
    """
    2017 - simple python spide
    """
    # Get html source
    html = getHtml("http://news.163.com")
    
    # Get img list from html
    imglist = getImg(html)

    # Download img file to local
    x = 0
    if len(imglist) != 0:
        for img in imglist:
            urllib.urlretrieve(img, 'd://abc//%s.jpg' % x)
            x += 1
            print img
