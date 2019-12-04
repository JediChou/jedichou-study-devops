# coding: utf-8

import win32con, win32api, os

# TODO 需进行测试

thefile = 'test'
f = open('test', 'w')
f.close()

win32api.SetFileAttributes(thefile, win32con.FILE_ATTRIBUTE_HIDDEN)
win32api.SetFileAttributes(thefile, win32con.FILE_ATTRIBUTE_READONLY)
win32api.SetFileAttributes(thefile, win32con.FILE_ATTRIBUTE_NORMAL)
os.remove(thefile)