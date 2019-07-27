#!/usr/bin/python

from urllib import urlopen
import re

rack_url = "http://114.foxconn.com"

text = urlopen(rack_url).read   ()
for line in text:
    print line
