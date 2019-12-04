#!/usr/bin/env python

## 如果文件比较小，请用这种方法
import linecache
theline = linecache.getline('lines.txt', 3)
print theline

## 如果文件比较大，请用这种方法
def getline(thefilepath, desired_line_number):
    if desired_line_number < 1: return ''
    for current_line_number, line in enumerate(open(thefilepath, 'rU')):
        if current_line_number == desired_line_number - 1: return line
    return ''