# coding=utf-8

import os

try:
    f = open("test.txt", "r", encoding="utf-8")
    s = f.readlines()
    f.close()
except:
    print("有异常产生")
finally:
    print("finally段被调用")
