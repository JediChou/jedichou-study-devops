# coding: utf-8

try:
    from msvcrt import getch
except ImportError:
    ''' 我们不在Windows中, 所以可以尝试类UNIX的方式 '''
    def getch():
        import sys, tty, termios
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(fd)
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch