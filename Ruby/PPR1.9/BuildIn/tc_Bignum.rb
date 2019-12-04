#####################################################################
# File name: tc_Bignum.rb
# Create date: 2013-10-8 13:30 PM
# Update date: 2013-10-8 15:01 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Bignum < Test::Unit::TestCase

	# Bignum < Integer
	# ------------------------------------------------------------------
	# Bignum objects hold integers outside the range of Fixnum-Bignum
	# objects are created automatically when integer calculations would
	# otherwise overflow. When a calculation involving Bignum objects
	# returns a result that will fit in a Fixnum, the result is
	# automatically converted.
	# 
	# For the purposes of the bitwise operations and [], a Bignum is
	# treated as if it were an infinite-length bitstring with 2's
	# complement representation.
	# 
	# While Fixnum values are immediate, Bignum objects are not - assignment
	# and parameter passing work with references to objects, not the
	# objects themselves.
	# ------------------------------------------------------------------


	# From the page 444
	# Performs various arithmetic operations on big.
	# big +  number Addition
	# big -  number Subtraction
	# big *  number Multiplication
	# big /  number Division
	# big %  number Modulo
	# big ** Exponentiation
	# big -@ Unary minus
	def test_Bignum_InstanceMethod_ArithmeticOperations
		assert_equal(14930118885, 9464646421 + 5465472464)
		assert_equal(464909951094, 465457845648 - 547894554)
		assert_equal(5233910444456812224, 5454646732 * 959532432)
		assert_equal(2002361, 465457845648579 / 232454498)
		assert_equal(984515, 465457845648579 % 2559872)
		assert_equal(969269785225, 984515 ** 2)
		# TODO, Unary minus
	end

	# From the page 444
	# ------------------------------------------------------------------
	# Performs various operations on the binary representations of the
	# Bignum.
	# ~big     Invert bits
	# big  |   number Bitwise or
	# big  &   number Bitwise and
	# big  ^   number bitwise exclusive or
	# big  <<  number Left-shift number bits
	# big  >>  number Right-shift number bits (with sign extension)
	def test_Bignum_InstanceMethod_BitOperations
		assert_equal(-7489734783346, ~7489734783345)
		assert_equal(905951211, 565654755 |  897156874)
		assert_equal(556860418, 565654755 &  897156874)
		assert_equal(349090793, 565654755 ^  897156874)
		assert_equal(2262619020, 565654755 << 2)
		assert_equal(141413688,  565654755 >> 2)
	end

	# From the page 444
	# ------------------------------------------------------------------
	# big <=> number -> -1, 0, +1, or nil
	# ------------------------------------------------------------------
	# Comparison - Returns -1, 0, or +1 depending on whether big is less
	# than, equal to, or greater than number. This is the basis for the
	# tests in Comparable.
	def test_Bignum_InstanceMethod_Comparison
		assert_equal( 1, 64564659871 <=> 1)
		assert_equal( 0, 64564659871 <=> 64564659871)
		assert_equal(-1, 64564659871 <=> 64564659872)
		assert_equal(nil, 64564659871 <=> 'obj')
	end

	# From the page 444
	# ------------------------------------------------------------------
	# big == obj -> true or false
	# ------------------------------------------------------------------
	# Returns true only if obj has the same value as big. Contrast this
	# with Bignum#eql?, which requires obj to be a Bignum.
	def test_Bignum_InstanceMethod_equal
		assert_equal(true, 564793987463497493 == 564793987463497493)
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big[n] -> 0, 1
	# ------------------------------------------------------------------
	# Bit Reference - Return the nth bit in the (assumed) binary
	# representation of big, where big[0] is the least significant bit.
	def test_Bignum_InstanceMethod_BitReference
		a = 9 ** 15; result = ""
		50.downto(0) do |n|
			result += a[n].to_s
		end
		assert_equal("000101110110100000111000011110010100111100010111001", result)
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big.abs -> bignum
	# ------------------------------------------------------------------
	# Returns the absolute value of big.
	def test_Bignum_InstanceMethod_abs
		assert_equal(6467497813566764674978135667,  6467497813566764674978135667.abs)
		assert_equal(6467497813566764674978135667, -6467497813566764674978135667.abs)
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big.div(number) -> other_number
	# ------------------------------------------------------------------
	# Synonym for Bignum#/.
	def test_Bignum_InstanceMethod_div
		assert_equal(-89910996357706, -1234567890987654321.div(13731))
		assert_equal(-89910996357705, -1234567890987654321.div(13731.0))
		assert_equal(1249999989, -1234567890987654321.div(-987654321))
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big.divmod(number) -> array
	# ------------------------------------------------------------------
	# See Numeric#divmod on page 595
	def test_Bignum_InstanceMethod_divmod
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big.eql?(obj) -> true or false
	# ------------------------------------------------------------------
	# Returns true only if obj is a Bignum with the same value as big.
	# Contrast this with Bignum#==, which performs type conversions.
	def test_Bignum_InstanceMethod_eql?
		assert_equal(true,  6465465465465.eql?(6465465465465) )
		assert_equal(false, 6465465465465.eql?(6465465465465.0) )
	end

	# From the page 445
	# ------------------------------------------------------------------
	# big.fdiv(number) -> float
	# ------------------------------------------------------------------
	# Returns the floating-point result of dividing big by number. Alias
	# for Bignum#quo.
	def test_Bignum_InstanceMethod_fdiv
		assert_equal(-89910996357705.52, -1234567890987654321.fdiv(13731))
		assert_equal(-89910996357705.52, -1234567890987654321.fdiv(13731.0))
		assert_equal(1249999989.609375, -1234567890987654321.fdiv(-987654321))
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.magnitude -> bignum
	# ------------------------------------------------------------------
	# Returns the magnitude of big (the distance of big from the origin
	# of the number line). Synonym for Bignum#abs. See also Complex#ma-
	# gnitude.
	def test_Bignum_InstanceMethod_magnitude
		assert_equal(6467497813566764674978135667,  6467497813566764674978135667.magnitude)
		assert_equal(6467497813566764674978135667, -6467497813566764674978135667.magnitude)
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.modulo(number) -> number
	# ------------------------------------------------------------------
	# synonym for Bignum#%
	def test_Bignum_InstanceMethod_modulo
		assert_equal(984515, 465457845648579.modulo(2559872))
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.remainder(number) -> other_number
	# ------------------------------------------------------------------
	# Returns the remainder after dividing big by number.
	def test_Bignum_InstanceMethod_remainder
		assert_equal(-6966, -1234567890987654321.remainder(13731))
		assert_equal(-9906.22531493148, -1234567890987654321.remainder(13731.24))
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.size -> integer
	# ------------------------------------------------------------------
	# Returns the number of bytes in the machine representation of big.
	def test_Bignum_InstanceMethod_size
		assert_equal(12, (256**10 - 1).size)
		assert_equal(20, (256**20 - 1).size)
		assert_equal(40, (256**40 - 1).size)
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.to_f -> float
	# ------------------------------------------------------------------
	# Converts big to a Float. If big doesn't fit in a Float, the result
	# is infinity.
	def test_Bignum_InstanceMethod_to_f
		assert_equal(4645646111.0, 4645646111.to_f)
	end

	# From the page 446
	# ------------------------------------------------------------------
	# big.to_s(base=10) -> str
	# ------------------------------------------------------------------
	# Returns a string containing the representation of big radix base
	# (2 to 36).
	def test_Bignum_InstanceMethod_to_s
		assert_equal("12345654321", 12345654321.to_s)
		assert_equal("1011011111110110111011110000110001", 12345654321.to_s(2))
		assert_equal("133766736061", 12345654321.to_s(8))
		assert_equal("2dfdbbc31", 12345654321.to_s(16))
		assert_equal("1dp1pc6d", 12345654321.to_s(26))
		assert_equal("rubyrules", 78546939656932.to_s(36))
	end
	
end
