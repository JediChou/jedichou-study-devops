#!/usr/bin/env python
"""
1.13访问子字符串, 封装为函数
"""

def fields(baseformat, theline, lastfield=False, _cache={ }):
    #生成键并尝试获得缓存的格式字符串
    key = baseformat, len(theline), lastfield
    format = _cache.get(key)
    if format is None:
	#没有缓存的格式字符串，创建并缓存之
	numremain = len(theline)-struct.calcsize(baseformat)
	_cache[key] = format = "%s %d%s" % (
	baseformat, numremain, lastfield and "s" or "x")
    return struct.unpack(format, theline)

