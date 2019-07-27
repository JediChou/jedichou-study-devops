class testable:
	def method1(self, number):
		number += 4
		number **= 0.5
		number *= 7
		return number
		
	def method2(self, number):
		return ((number * 2) ** 1.27) * 0.3
		
	def method3(self, number):
		return self.method(number) + self.method3.method3(number)
		
	def method4(self):
		return 1.173 * self.method3(id(self))
