#####################################################################
# File name: tc_Integer.rb
# Create date: 2013-9-27 15:18 PM
# Update date: 2013-9-27 17:12 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_Integer < Test::Unit::TestCase
	
	# From the page 532
	# ------------------------------------------------------------------
	# int.ceil -> integer
	# ------------------------------------------------------------------
	# Synonym for Integer#to_i
	def test_Interger_InstanceMethods_ceil
		assert_equal(2.0, 2.ceil)
	end

	# From the page 532
	# ------------------------------------------------------------------
	#           int.chr -> string
	# int.chr(encoding) -> string
	# ------------------------------------------------------------------
	# Returns a string containing the character represented by the
	# receiver's value. Values less than 128 always returned as ASCII.
	# The encoding of strings representing higher values can be set using
	# the opitonal parameter.
	def test_Integer_InstanceMethods_chr
		assert_equal('A', 65.chr)
		assert_equal('a', ?a.chr)
		assert_equal("\xE9", 233.chr)
	end

	# From the page 532
	# ------------------------------------------------------------------
	# int.denominator -> integer
	# ------------------------------------------------------------------
	# Converts the denominator of the rational representation of int.
	def test_Integer_InstanceMethods_denominator
		assert_equal(1, 1.denominator)
		assert_equal(2, 1.5.denominator)
		num = 1.0/3
		num.to_r
		assert_equal(18014398509481984, num.denominator)
	end

	# From the page 532
	# ------------------------------------------------------------------
	# int.downto(integer) {|i|...} -> int
	# ------------------------------------------------------------------
	# Iterates block, passing decreasing values from int down to and
	# including integer.
	def test_Integer_InstanceMethods_downto
		result = []
		5.downto(1) {|n| result.push(n)}
		assert_equal([5,4,3,2,1], result)
	end

	# From the page 532
	# ------------------------------------------------------------------
	# int.even? -> true of false
	# ------------------------------------------------------------------
	# Returns true if int is even.
	def test_Integer_InstanceMethods_even?
		assert_equal(false, 1.even?)
		assert_equal(true , 2.even?)
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.floor -> integer
	# ------------------------------------------------------------------
	# Returns the largest integer less than or equal to int. Equivalent
	# to Integer#to_i.
	def test_Integer_InstanceMethods_floor
		assert_equal(1, 1.floor)
		assert_equal(-1, (-1).floor)
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.gcd(other_integer) -> integer
	# ------------------------------------------------------------------
	# Returns the greatest common denominator of int and other_integer.
	def test_Integer_InstanceMethods_gcd
		assert_equal(5, 10.gcd(15))
		assert_equal(2, 10.gcd(16))
		assert_equal(1, 10.gcd(17))
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.gcdlcm(other_integer) -> [gcd, lcm]
	# ------------------------------------------------------------------
	# Returns both the GCD and the LCM of int and other_integer.
	def test_Integer_InstanceMethods_gcdlcm
		assert_equal([5,30], 10.gcdlcm(15))
		assert_equal([2,80], 10.gcdlcm(16))
		assert_equal([1,170], 10.gcdlcm(17))
		assert_equal([1, 6], 2.gcdlcm(3))
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.integer? -> true
	# ------------------------------------------------------------------
	# Always returns true.
	def test_Integer_InstanceMethods_integer?
		assert_equal(true,  1.integer?)
		assert_equal(false, 1.0.integer?)
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.lcm(other_integer) -> integer
	# ------------------------------------------------------------------
	# Returns the lowest common multiple of int and other_integer
	def test_Integer_InstanceMethods_lcm
		assert_equal(30, 10.lcm(15))
		assert_equal(20, 10.lcm(20))
		assert_equal(10, 10.lcm(-2))
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.next -> integer
	# ------------------------------------------------------------------
	# Returns the Integer equal int+1.
	def test_Integer_InstanceMethods_next
		assert_equal(2, 1.next)
		assert_equal(0, -1.next)
	end

	# From the page 533
	# ------------------------------------------------------------------
	# int.numerator -> integer
	# ------------------------------------------------------------------
	# Converts the numerator of the rational representation of int.
	def test_Integer_InstanceMethods_numerator
		assert_equal(1, 1.numerator)
		assert_equal(3, 1.5.numerator)
		num = 1.0/3
		assert_equal(6004799503160661, num.numerator)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.odd? -> true or false
	# ------------------------------------------------------------------
	# Returns true if int is odd.
	def test_Integer_InstanceMethods_odd?
		assert_equal(true,  1.odd?)
		assert_equal(false, 2.odd?)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.ord -> int
	# ------------------------------------------------------------------
	# The ord method was added to assist in the migration from Ruby 1.8
	# to 1.9. It allows ?A.ord to return 65. If ?A returns a string, ord
	# will be called on that string and return 65; if ?A returns an
	# integer, then Numeric#ord is called, which is basically a no-op
	def test_Integer_InstanceMethods_ord
		assert_equal(1, 1.ord)
		assert_equal(65, ?A.ord)
		assert_equal(66, ?B.ord)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.pred -> integer
	# ------------------------------------------------------------------
	# Returns int-1.
	def test_Integer_InstanceMethods_pred
		assert_equal(2, 3.pred)
		assert_equal(3, 4.pred)
		assert_equal(4, 5.pred)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.rationalize(eps=nil) -> rational
	# ------------------------------------------------------------------
	# Returns the rational number int/1. The argument is always ignored.
	# Effectively a synonym for Integer.to_r.
	def test_Integer_InstanceMethods_to_r
		# TODO
		# assert_equal(99.0, 99.rationalize)
		# assert_equal(-12345678.0, -12345678.rationalize(99))
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.round -> integer
	# ------------------------------------------------------------------
	# Synonym for Integer#to_i
	def test_Integer_InstanceMethods_round
		assert_equal(1.0, 1.to_i)
		assert_equal(2.0, 2.to_i)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.succ -> integer
	# ------------------------------------------------------------------
	# Synonym for Integer#next.
	def test_Integer_InstanceMethods_succ
		assert_equal(3, 2.succ)
		assert_equal(23,22.succ)
		assert_equal(21,20.succ)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.times {|i|...} -> int
	# ------------------------------------------------------------------
	# Iterators block int times, passing in values from zero to int-1.
	def test_Integer_InstanceMethods_times
		result = []
		5.times do |i|
			result.push(i)
		end
		assert_equal([0,1,2,3,4], result)
	end

	# From the page 534
	# ------------------------------------------------------------------
	# int.to_i -> int
	# ------------------------------------------------------------------
	# Returns int.
	def test_Integer_InstanceMethods_to_i
		assert_equal(1.0, 1.to_i)
		assert_equal(2.0, 2.to_i)
	end

	# From the page 535
	# ------------------------------------------------------------------
	# int.to_int -> integer
	# ------------------------------------------------------------------
	# Synonym for Integer#to_i.
	def test_Integer_InstanceMethods_to_int
		assert_equal(1, 1.to_i)
		assert_equal(2, 2.to_i)
	end

	# From the page 535
	# ------------------------------------------------------------------
	# int.to_r -> number
	# ------------------------------------------------------------------
	# Converts int to a rational number.
	def test_Integer_InstanceMethods_to_r
		assert_equal(1/1,  1.to_r)
		assert_equal(-1/1, -1.to_r)
	end

	# From the page 535
	# ------------------------------------------------------------------
	# int.truncate -> integer
	# ------------------------------------------------------------------
	# Synonym for Integer#to_i.
	def test_Integer_InstanceMethods_truncate
		assert_equal(1, 1.truncate)
		assert_equal(2, 2.truncate)
	end

	# From the page 535
	# ------------------------------------------------------------------
	# int.upto( integer ) {|i|...} -> int
	# ------------------------------------------------------------------
	# Iterates block, passing in integer values from int up to and
	# including integer.
	def test_Integer_InstanceMethods_upto
		result = []
		1.upto(5) {|i| result.push(i)}
		assert_equal([1,2,3,4,5], result)
	end

end
