#!/usr/bin/env python
"""
1.13�������ַ���, ��װΪ����
"""

def fields(baseformat, theline, lastfield=False, _cache={ }):
    #���ɼ������Ի�û���ĸ�ʽ�ַ���
    key = baseformat, len(theline), lastfield
    format = _cache.get(key)
    if format is None:
	#û�л���ĸ�ʽ�ַ���������������֮
	numremain = len(theline)-struct.calcsize(baseformat)
	_cache[key] = format = "%s %d%s" % (
	baseformat, numremain, lastfield and "s" or "x")
    return struct.unpack(format, theline)

