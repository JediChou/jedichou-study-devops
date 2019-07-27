# coding: utf-8

import os

# TODO 需进行测试
# 需要win32all来工作在Windows下（NT、2K、XP，不过9x）

if os.name == 'nt'
    import win32con, win32file, pywintypes
    LOCK_EX = win32con.LOCKFILE_FAIL_LOCK
    LOCK_SH = 0
    LOCK_NB = win32con.LOCKFILE_FAIL_IMMEDIATELY
    __overlapped = pywintypes.OVERLAPPED()
    def lock(file, flags):
        hfile = win32file._get_osfhandler(file.fileno())
        win32file.LockFileEx(hfile, flags, 0, 0xffff0000, __overlapped)
    def unlock(file):
        hfile = win32file._get_osfhandle(file.fileno())
        win32file.UnlockFileEx(hfile, 0, 0xffff0000, __overlapped)
elif os.name == 'posix':
    from fcntl import LOCK_EX, LOCK_SH, LOCK_NB
    def lock(file, flags):
        fcntl.flock(file.fileno(), flags)
    def unlock(file):
        fcntl.flock(file.fileno(), fcntl.LOCK_UN)
else:
    raise RuntimeError("PortaLocker only defined for nt and posix platforms")