# coding: utf-8

from cStringIO import StringIO

class RewindableFile(object):

	""" 封装一个文件句柄以便重定位到开始位置 """
	def __init__(self, input_file):
		""" 将input_file封装到一个支持回退的类文件对象中 """
		self.file = input_file
		self.buffer_file = StringIO()
		self.at_start = True
		try:
			self.start = input_file.tell()
		except (IOError, AttributeError):
			self.start = 0
		self._use_buffer = True

	def seek(self, offset, whence=0):
		""" 根据给定的字节定位.
		必须: whence == 0 and offset == self.start
		"""
		if whence != 0:
			raise ValueError("Whence=%r; expecting 0" % (whence,))
		if offset != self.start:
			raise ValueError("offset=%r; expecting %s" % (offset, self.start))
		self.rewind()

	def rewind(self):
		""" 回到起始位置 """
		self.buffer_file.seek(0)
		self.at_start = True

	def tell(self):
		""" 返回文件的当前位置(必须在开始处) """
		if not self.at_start:
			raise TypeError("RewindableFile can't tell except at start of file")
		return self.start
	
	def _read(self, size):
		# 一直读到文件末尾
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
		""" 根据size指定的大小读取数据默认为-1, 意味着
		一直读到文件结束
		"""
		x = self._read(size)
		if self.at_start and x:
			self.at_start = False
		self._check_no_buffer()
		return x

	def readline(self):
		""" 从文件中读取一行 """
		# buffer_file中有吗?
		s = self.buffer_file.readline()
		if s[-1:] == "\n":
			return s
		# 没有, 从输入文件中读取一行
		t = self.file.readline()
		if self._use_buffer:
			self.buffer_file.write(t)
		self._check_no_buffer()
		return s + t

	def readlines(self):
		""" 读取文件中所有剩余的行 """
		return self.read().splitlines(True)

	def _check_no_buffer(self)
		# 如果'nobuffer'被调用, 而且我们也完成了对缓存文件的处理
		# 那就删掉缓存, 把所有的东西都重定向到原来的输入文件
		if not self._use_buffer and \
				self.buffer_file.tell() == len(self.buffer_file.getvalue()):
			# 为了获得尽可能高的性能, 我们重新绑定了self中的所有相关方法
			for n in 'seek tell read readline readlines'.split():
				setattr(self, n, getatrr(self.file, n, None))
			del self.buffer_file

	def nobuffer(self):
		""" 通知RewindableFile, 一旦缓存耗尽就停止使用缓存 """
		self._use_buffer = False

# TODO: 这个类还未充分理解, 后续需做测试 (Jedi)
