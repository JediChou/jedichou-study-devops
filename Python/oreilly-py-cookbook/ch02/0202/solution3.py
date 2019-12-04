#!/usr/bin/env python
# -*- coding: utf-8 -*-

person = ['Pen Zi', 'Jiu Sheng', 'Duan Zi Shou']

# 用文本方式写入
file_object = open('txtfile.txt', 'w')
file_object.writelines(person)
file_object.close()

# 用二进制方式写入
open('binfile.bin', 'wb').writelines(person)