#####################################################################
# File name: tc_Method.rb
# Create date: 2013-9-29 14:01 PM
# Update date: 2013-9-29 15:54 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Method < Test::Unit::TestCase

	# Method
	# -------------------------------------------------------------------
	# Method objects are created by Object#method. They are associated
	# with a particular object (not just with a class). They may be used
	# to invoke the method within the object and as a block associated
	# with an iterator. They may also be unbound from one object (creating
	# an UnboundMethod) and bound to another

	# From the page 565
	def test_Method_Introduce
		meth = self.method(:square)
		assert_equal(81, meth.call(9))
		assert_equal([1,4,9], [1,2,3].collect(&meth))
	end

	# From the page 565
	# ------------------------------------------------------------------
	# meth[<args>*] -> object
	# ------------------------------------------------------------------
	# Synonym for Method#call
	def test_Method_InstanceMethods_meth
		# Define a method
		def fred()
			puts "Hello"
		end
		alias bert fred
		
		m1 = method(:fred)
		m2 = method(:bert)
		assert_equal(m1, m2)
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.arity -> fixnum
	# ------------------------------------------------------------------
	# Returns a non-negative integer for methods that take a fixed number
	# of arguments. For Ruby methods that take a variable number of
	# arguments, return -n-1, where n is the number of required arguments.
	# For methods written in C, return -1 if the call takes a variable
	# number of arguments. See Method#parameters.
	def test_Method_InstanceMethods_arity
		c = C.new
		assert_equal(0,  c.method(:one).arity)
		assert_equal(1,  c.method(:two).arity)
		assert_equal(-1, c.method(:three).arity)
		assert_equal(2,  c.method(:four).arity)
		assert_equal(-3, c.method(:five).arity)
		assert_equal(-3, c.method(:six).arity)

		# other assertion
		assert_equal(0,  "cat".method(:size).arity)
		assert_equal(1,  "cat".method(:replace).arity)
		assert_equal(-1, "cat".method(:squeeze).arity)
		assert_equal(-1, "cat".method(:count).arity)
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.call(<args>*) -> object
	# ------------------------------------------------------------------
	# Invokes the meth with specified arguments, returning the method's
	# return value.
	def test_Method_InstanceMethods_call
		m = 12.method("+")
		assert_equal(15, m.call(3))
		assert_equal(32, m.call(20))
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.eql?(other) -> true or false
	# ------------------------------------------------------------------
	# Returns true if meth is the same method as other
	def test_Method_InstanceMethods_eql?
		# Inside eql?
		def fred() return "a"+"b" end
		alias bert fred
		m1 = method(:fred)
		m2 = method(:bert)
		assert_equal(true, m1.eql?(m2))
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.name -> string
	# ------------------------------------------------------------------
	# Returns the name of the method meth.
	def test_Method_InstanceMethods_meth
		method = "cat".method(:upcase)
		assert_equal("upcase", method.name.to_s)
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.owner -> module
	# ------------------------------------------------------------------
	# Returns the class or module in which meth is defined
	def test_Method_InstanceMethods_owner
		method = "cat".method(:upcase)
		assert_equal("String", method.owner.to_s)
	end

	# From the page 566
	# ------------------------------------------------------------------
	# meth.parameters -> array
	# ------------------------------------------------------------------
	# Returns an array describing the parameters taken by the method. Each
	# entry in the array is itself an array. The first entry subarray
	# contains the role of the parameter (:req for required, :opt for
	# optional, :rest for a splat parameter, and :block for a block). If
	# the parameter has a name, it will be the second entry in the subarray.
	def test_Method_InstanceMethods_parameters
		def m(a,b=1,*c,&d); end
		# TODO, assert_equal([[:req,:a],[:opt,:b],[:rest,:c],[:block,:d]], method(:m).parameters)
	end

	# From the page 567
	# ------------------------------------------------------------------
	# meth.receiver -> obj
	# ------------------------------------------------------------------
	# Returns the object on which meth is defined.
	def test_Method_InstanceMethods_receiver
		method = "cat".method(:upcase)
		# TODO, assert_equal("cat", method.receviver)
	end

	# From the page 567
	# ------------------------------------------------------------------
	# meth.source_location -> [filename, lineno] or nil
	# ------------------------------------------------------------------
	# Returns the source filename and line number where meth was defined
	# or nil self was not defined in Ruby source.
	def test_Method_InstanceMethods_source_location
		internal_method = "cat".method(:upcase)
		assert_equal(nil, internal_method.source_location)

		# other test
		require 'set'
		set = Set.new
		ruby_method = set.method(:clear)
		assert_equal(false, ruby_method.source_location[0].to_s.empty?)
		assert_equal(false, ruby_method.source_location[1].to_s.empty?)
	end

	# From the page 567
	# ------------------------------------------------------------------
	# meth.to_proc -> prc
	# ------------------------------------------------------------------
	# Returns a Proc object corresponding to this method. Because to_proc
	# is called by the interpreter when passing block arguments, method
	# may be used following an ampersand to pass a block to another method
	# call. See example at the start of this section.
	def test_Method_InstanceMethods_to_proc
		pass
	end

	# From the page 567
	# ------------------------------------------------------------------
	# meth.unbind -> unbound_method
	# ------------------------------------------------------------------
	# Dissociates meth from its current receiver. The resulting
	# UnboundMethod can subsequently be bound to a new object of the same
	# class (See UnboundMethod on page 726).
	def test_Method_InstanceMethods_unbind
		pass
	end

end

# For test method -> test_Method_Introduce
def square(n)
	n * n
end

# For test method -> test_Method_InstanceMethods_arity
class C
	def one;			end
	def two(a);			end
	def three(*a);		end
	def four(a,b);		end
	def five(a,b,*c);	end
	def six(a,b,*c,&d);	end
end
