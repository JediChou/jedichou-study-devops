#####################################################################
# File name: tc_Binding.rb
# Create date: 2013-10-8 13:16 PM
# Update date: 2013-10-8 13:28 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Binding < Test::Unit::TestCase
	
	# From the page 447
	# ------------------------------------------------------------------
	# Objects of class Binding encapsulate the execution context at some
	# particular place in the code and retain this context for future use.
	# Access to the variable, methods, value of self, and possibly an
	# iterator block accessible in this context are all retained. Binding
	# objects can be created using Object#binding and are made available
	# to the callback of Object#set_trace_func and to the block passed to
	# to TracePoint.new.
	def test_Binding_IntroductionAndEval
		k1 = Demo.new(99)
		b1 = k1.get_binding
		k2 = Demo.new(-3)
		b2 = k2.get_binding
		
		assert_equal(99,  eval("@secret",b1))
		assert_equal(-3,  b2.eval("@secret"))
		assert_equal(nil, eval("@secret"))
	end

end

## test class for test_Binding_IntroductionAndEval
class Demo
	def initialize(n)
		@secret = n
	end
	def get_binding
		return binding()
	end
end
