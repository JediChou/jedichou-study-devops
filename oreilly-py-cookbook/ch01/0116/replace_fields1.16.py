#!/usr/bin/env python
'''
1.16�滻�ַ����е��Ӵ�
'''
#����һ���ַ�����ͨ����ѯһ���滻�ֵ䣬���ַ����б���ǵ����ַ����滻��

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
