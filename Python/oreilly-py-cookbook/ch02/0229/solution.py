# coding: utf-8
# TODO 需进行测试（这是一个比较实用的一个函数）

def VersionFile(file_spec, vtype='copy'):
    import os, shutil
    if os.path.isfile(file_spec):
        if vtype not in ('copy', 'rename'):
            raise ValueError, 'Unknown vtype %r' % (vtype,)
        n, e = os.path.splitext(file_spec)
        if len(e) == 4 and e[1:].isdigit():
            num = 1 + int(e[1:])
            root = n
        else:
            num = 0
            root = file_spec
        for i in xrange(num, 1000):
            new_file = '%s.%03d' % (root, i)
            if not os.path.exists(new_file):
                if vtype == 'copy':
                    shutil.copy(file_spec, new_file)
                else:
                    os.rename(file_spec, new_file)
        raise RuntimeError, "Can't%s%r, all names taken" % (vtype, file_spec)
    return False
    
if __name__ == "__main__":
    import os
    tfn = 'test.txt'
    open(tfn, 'w').close()
    print VersionFile(tfn)
    print VersionFile(tfn)
    print VersionFile(tfn)
    
    for x in ('', '.000', '.001','.002'):
        os.unlink(tfn + x)
        
    print VersionFile(tfn)
    print VersionFile(tfn)