#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os, htmllib, formatter

# 使用UNIX的tput来捕获粗体、下划线和重设的转义序列
set_bold = os.popen('tput bold').read()
set_underline = os.popen('tput smul').read()
perform_reset = os.popen('tput sgr0').read()

class TtyFormatter(formatter.AbstractFormatter):
    '''
    一个保留粗体和斜体状态的格式化对象，并输出
    相应的终端控制序列
    '''
    def __init__(self, writer):
        # 首先，像往常一样，初始化超类
        formatter.AbstractFormatter.__init__(self, writer)
        # 一开始既没有粗体也没有斜体状态，未保存任何信息
        self.fontState = False, False
        self.fontStack = []
        
    def push_font(self, font):
        # font元组有4项，我们只看与粗体和斜体的状态
        # 有关的两个标志
        size, is_italic, is_bold, is_tt = font
        self.fontStack.append((is_italic, is_bold))
        self._updateFontState()
        
    def pop_font(self, *args):
        # 回到前一个font状态
        try:
            self.fontStack.pop()
        except IndexError:
            pass
        self._updateFontState()
        
    def updateFontState(self):
        # 输出正确的终端控制序列，如果粗体/或斜体（==underline）
        # 的状态被刚刚改变的话
        try:
            newState = self.fontStack[-1]
        except IndexError:
            newState = False, False
        if self.fontState != newState:
            # 相关的状态改变：重置终端
            print perform_reset,
            # 如果需要的话，设置下划线/或粗体状态
            if newState[0]:
                print set_underline,
            if newState[1]:
                print set_bold,
            # 记住当前的两个状态
            self.fontState = newState
            
# 生成写入、格式化、解析对象，根据需要将它们连接起来
myWriter = formatter.DumbWriter()
if sys.stdout.isatty():
    myFormatter = TtyFormatter(myWriter)
else:
    myFormatter = formatter.AbstractFormatter(myWriter)
myParser = htmllib.HTMLParser(myFormatter)

# 将标准输入和终端操作提供给解析器
myParser.feed(sys.stdin.read())
myParser.close()