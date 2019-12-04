# coding: utf-8

from cStringIO import StringIO

class RewindableFile(object):

	def __init__(self, input_file):
		self.file = input_file
		self.buffer_file = StringIO()
		self.at_start = True
		try:
			self.start = input_file.tell()
		except (IOError, AttributeError):
			self.start = 0
		self._use_buffer = True

	def seek(self, offset, whence=0):
		if whence != 0:
			raise ValueError("Whence=%r; expecting 0" % (whence,))
		if offset != self.start:
			raise ValueError("offset=%r; expecting %s" % (offset, self.start))
		self.rewind()

	def rewind(self):
		self.buffer_file.seek(0)
		self.at_start = True

	def tell(self):
		if not self.at_start:
			raise TypeError("RewindableFile can't tell except at start of file")
		return self.start
	
	def _read(self, size):
		if size < 0 :
			y = self.file.read()
			if self._use_buffer:
				self.buffer_file.write(y)
			return self.buffer_file.read() + y
		elif size == 0:
			return ""
		x = self.buffer_file.read(size)
		if len(x) < size:
			y = self.file.read(size-len(x))
			if self._use_buffer:
				self.buffer_file.write(y)
			return x+y
		return x

	def read(self, size=-1):
		x = self._read(size)
		if self.at_start and x:
			self.at_start = False
		self._check_no_buffer()
		return x

	def readline(self):

		s = self.buffer_file.readline()
		if s[-1:] == "\n":
			return s

		t = self.file.readline()
		if self._use_buffer:
			self.buffer_file.write(t)
		self._check_no_buffer()
		return s + t

	def readlines(self):
		return self.read().splitlines(True)

	def _check_no_buffer(self)
		if not self._use_buffer and \
				self.buffer_file.tell() == len(self.buffer_file.getvalue()):
			for n in 'seek tell read readline readlines'.split():
				setattr(self, n, getatrr(self.file, n, None))
			del self.buffer_file

	def nobuffer(self):
		self._use_buffer = False
