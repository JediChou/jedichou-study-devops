#####################################################################
# File name: tc_Fixnum.rb
# Create date: 2013-9-29 11:50 AM
# Update date: 2013-9-29 13:58 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_Fixnum < Test::Unit::TestCase
	
	# A Fixnum holds integer values that can be represented in a native
	# machine word (minus 1 bit). If any operation on a Fixnum exceeds
	# this range, the value is converted to a Bignum.
	# 
	# Fixnum objects have immediate value. This means that when they
	# are assigned or passed as parameters, the actual object is passed,
	# rather than a reference to that object. Assignment does not alias
	# Fixnum objects. Because there is effectively only on Fixnum object
	# instance for any given integer value, you cannot, fox example, add
	# a singleton method to a Fixnum.
	

	# From the page 510
	# ------------------------------------------------------------------
	# Performs various arithmetic operations on fix.
	# ------------------------------------------------------------------
	# fix  +  numeric  Additon
	# fix  -  numeric  Subtraction
	# fix  *  numeric  Multiplication
	# fix  /  numeric  Division
	# fix  %  numeric  Modulo
	# fix **  numeric  Exponentiation
	# fix -@  numeric  Unary minus
	def test_Fixnum_InstanceMethods_ArithmeticOperations
	end

	# From the page 510
	# ------------------------------------------------------------------
	# Performs various operations on the binary representations of the
	# Fixnum.
	# ~fix              Invert bits
	# fix  |   numeric  Bitwise or
	# fix  &   numeric  Bitwise and
	# fix  ^   numeric  Bitwise exclusive or
	# fix  <<  numeric  Left-shift numeric bits
	# fix  >>  numeric  Right-shift numeric bit (with sign extension)
	def test_Fixnum_InstanceMethods_BitOperations
	end

	# From the page 510
	# ------------------------------------------------------------------
	# Compares fix to other numbers. Fixnum. <, <=, ==, >= and >.
	def test_Fixnum_InstanceMethods_Comparisons
	end

	# From the page 510
	# ------------------------------------------------------------------
	# fix <=> numeric -> 1, 0, +1, or nil
	# ------------------------------------------------------------------
	# Comparison - Returns -1, 0, or +1 depending on whether fix is less
	# than, equal to, or greater than numeric. Although Fixnum's
	# grandparent mixes in Comparable, Fixnum does not use that module
	# for performing comparisons, instead implementing the comparison
	# operators explicitly.
	def test_Fixnum_InstanceMethods_Comparison
		assert_equal(1, 42 <=> 13)
		assert_equal(-1, 13 <=> 42)
		assert_equal(0, -1 <=> -1)
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix[n] -> 0, 1
	# ------------------------------------------------------------------
	# Bit Reference - Returns the nth bit in the binary representation
	# of fix, where fix[0] is the least significant bit.
	def test_Fixnum_InstanceMethods_BitReference
		a = 0b11001100101010; result = ""
		30.downto(0) {|n| result<<a[n].to_s}
		assert_equal("0000000000000000011001100101010", result)
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.abs -> int
	# ------------------------------------------------------------------
	# Returns the absolute value of fix.
	def test_Fixnum_InstanceMethods_abs
		assert_equal(12345, -12345.abs)
		assert_equal(12345, 12345.abs)
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.div(numeric) -> integer
	# ------------------------------------------------------------------
	# Divison that always produces an integral result. No affected by
	# the mathn library (unlike Fixnum#/).
	def test_Fixnum_InstanceMethods_div
		assert_equal(47, 654321.div(13731))
		assert_equal(47, 654321.div(13731.34))
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.even? -> true or false
	# ------------------------------------------------------------------
	# Returns true if fix is even.
	def test_Fixnum_InstanceMethods_even?
		assert_equal(false, 1.even?)
		assert_equal(true , 2.even?)
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.divmod(numeric) -> array
	# ------------------------------------------------------------------
	# See Numeric#divmod on page 595
	def test_Fixnum_InstanceMethods_divmod
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.fdiv(numeric) -> float
	# ------------------------------------------------------------------
	# Returns the floating-point result of dividing fix by numeric.
	def test_Fixnum_InstanceMethods_fdiv
		assert_equal(7.0, 63.fdiv(9))
		assert_equal(47.652829364212366, 654321.fdiv(13731))
		assert_equal(47.65199646936475, 654321.fdiv(13731.24))
	end

	# From the page 511
	# ------------------------------------------------------------------
	# fix.magnitude -> int
	# ------------------------------------------------------------------
	# Returns the magnitude of fix (the distance of fix from the origin
	# of the number line). Synonym for Fixnum#abs. See also Complex#magnitude.
	def test_Fixnum_InstanceMethods_magnitude
		assert_equal(123.123, -123.123.magnitude)
		assert_equal(123.123, 123.123.magnitude)
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.modulo(numeric) -> numeric
	# ------------------------------------------------------------------
	# Synonym for Fixnum#%
	def test_Fixnum_InstanceMethods_modulo
		assert_equal(8964, 654321.modulo(13731))
		assert_equal(8952.72000000001, 654321.modulo(13731.24))
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.odd? -> true or false
	# ------------------------------------------------------------------
	# Returns true if fix is odd.
	def test_Fixnum_InstanceMethods_odd?
		assert_equal(true, 1.odd?)
		assert_equal(false,2.odd?)
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.size -> int
	# ------------------------------------------------------------------
	# Returns the number of bytes in the machine representation of a Fixnum
	def test_Fixnum_InstanceMethods_size
		# Test pass under Windows XP 32-bit platform
		assert_equal(4,  1.size)
		assert_equal(4, -1.size)
		assert_equal(4, 2147483647.size)
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.succ -> int
	# ------------------------------------------------------------------
	# Returns fix + 1.
	def test_Fixnum_InstanceMethods_succ
		assert_equal(2,  1.succ)
		assert_equal(0, -1.succ)
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.to_f -> float
	# ------------------------------------------------------------------
	# Converts fix to a Float.
	def test_Fixnum_InstanceMethods_to_f
		assert_equal(2.0, 2.to_f)
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.to_s(base=10) -> string
	# ------------------------------------------------------------------
	# Returns a string containing the representation of fix radix base
	# (2 to 36).
	def test_Fixnum_InstanceMethods_to_s
		assert_equal("12345", 12345.to_s)
		assert_equal("11000000111001", 12345.to_s(2))
		assert_equal("30071", 12345.to_s(8))
		assert_equal("12345", 12345.to_s(10))
		assert_equal("3039", 12345.to_s(16))
		assert_equal("9ix", 12345.to_s(36))
		assert_equal("anotherrubyhacker", 84823723233035811745497171.to_s(36))
	end

	# From the page 512
	# ------------------------------------------------------------------
	# fix.zero? -> true or false
	# ------------------------------------------------------------------
	# Returns true if fix is zero.
	def test_Fixnum_InstanceMethods_zero?
		assert_equal(false, 42.zero?)
		assert_equal(true , 0.zero?)
	end

end
