import zipfile

try:
    from cStringIO import StringIO
except ImportError:
    from StringIO import StringIO
    
class ZipString(zipFile):
    def __init__(self, datastring):
        ZipFile.__init__(self, StringIO(datastring))