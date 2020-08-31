# coding=utf-8

import os

try:
    with open("test.txt", "r") as f:
        print(f.read())
except IOError:
    print("文件类错误处理")
except:
    print("其他类型错误处理")

print(u"处理完毕!")
