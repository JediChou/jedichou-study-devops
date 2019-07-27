import urllib2

"""
http://stackoverflow.com/questions/34079/how-to-specify-an-authenticated-proxy-for-a-python-http-connection
http://stackoverflow.com/questions/1450132/proxy-with-urllib2
"""

def Method1():
    proxy = urllib2.ProxyHandler({'http': 'F3216338:samsung00s@10.191.131.14:3128'})
    opener = urllib2.build_opener(proxy)
    urllib2.install_opener(opener)
    print urllib2.urlopen('http://ach.efoxconn.com:8080').read()

if __name__ == '__main__':
    Method1()
