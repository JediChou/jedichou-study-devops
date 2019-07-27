# coding: utf-8

"""处理文件读取时产生的异常，本方式确保文件句柄被close"""
try:
    file_object = open("don_exists.txt")
    try:
        all_the_text = file_object.read()
    finally:
        file_object.close()
except:
    print "read file miss some errors"