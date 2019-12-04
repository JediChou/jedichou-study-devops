# coding:utf-8

def reindent(s, numSpaces):
    """ 整体在最前端添加空格，类似选中文本然后按Tab的效果 """
    leading_space = numSpaces * ' '
    lines = [ leading_space + line.strip()
              for line in s.splitlines() ]
    return '\n'.join(lines)

if __name__ == "__main__":
    s = """
    sara, sarah, tara
    tira, miki,  abby
    xin,  yoyo,  sammi
    """
    print s
    print reindent(s, 20)
