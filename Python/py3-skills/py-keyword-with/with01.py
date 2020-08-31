# coding=utf-8

import os

f = open("test.txt", "r", encoding="utf-8")
s = f.readlines()
f.close()

"""
    使用with的原因: part1-不带异常处理时打开文件异常.
    Env: Windows sub linux, python3
    $ python with01.py
    Traceback (most recent call last):
    File "with01.py", line 4, in <module>
        f = open("test.txt", "r", encoding="utf-8")
    TypeError: 'econding' is an invalid keyword argument for this function
"""
