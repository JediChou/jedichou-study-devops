#!/usr/bin/env python
'''
1.16替换字符串中的子串
'''
#给定一个字符串，通过查询一个替换字典，将字符串中被标记的子字符串替换掉

def expand(format, d, marker='"', safe=False):
    if safe:
        def lookup(w): return d.get(w, w.join(marker*2))
    else:
        def lookup(w): return d[w]
    parts = format.split(marker)
    parts[1::2] = map(lookup, parts[1::2])
    return ''.join(parts)
if __name__ == '__main__':
    print expand('just "a" test', {'c': 'one'})
