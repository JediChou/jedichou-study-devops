# -*- coding: utf-8 -*-
# file: dateitem.py
import time
current = time.localtime()

print "current year: %s " % current.tm_year
print "current month: %s " % current.tm_mon
print "current day: %s " % current.tm_mday
print "current hour: %s " % current.tm_hour
print "current min: %s " % current.tm_min
print "current second: %s " % current.tm_sec

print 
print "%sth day of week" % current.tm_wday
print "%sth day of year" % current.tm_yday
