#####################################################################
# File name: tc_Ratinal.rb
# Create date: 2013-9-26 10:53 AM
# Update date: 2013-9-26 12:07 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Rational < Test::Unit::TestCase
	
	# From the page 656
	# Class introduce
	def test_Rational_Introduce
		assert_equal(0.5, Rational("1/2"))
		assert_equal(0.8, 4.quo(5))
		assert_equal(0.4, 0.5*0.8)
	end

	# From the page 656
	# Arithmetic operations, Peforms various arithmetic operations on
	# rat.
	def test_Rational_ArithmeticOperations
		assert_equal(1.0, Rational("1/2") + Rational("1/2"))
		assert_equal(0.0, Rational("1/2") - Rational("1/2"))
		assert_equal(0.25, Rational("1/2") * Rational("1/2"))
		assert_equal(1.0, Rational("1/2") / Rational("1/2"))
		assert_equal(0, Rational("1/2") % Rational("1/2"))
		assert_equal(4.0, Rational("2") ** Rational("2"))
		# assert_equal(1, -@ Rational("2"))
	end

	# From the page 656
	# Compares rat to other numbers: <, <=, ==, >=, and >.
	def test_Rational_Compares
		assert_equal(true,  Rational("1") <  Rational("2"))
		assert_equal(false, Rational("2") <  Rational("1"))
		assert_equal(true,  Rational("1") <= Rational("2"))
		assert_equal(true,  Rational("2") <= Rational("2"))
		assert_equal(false, Rational("4") <= Rational("2"))
		assert_equal(true,  Rational("2") == Rational("2"))
		assert_equal(false, Rational("1") == Rational("2"))
		assert_equal(true,  Rational("2") >= Rational("1"))
		assert_equal(true,  Rational("2") >= Rational("2"))
		assert_equal(false, Rational("1") >= Rational("2"))
		assert_equal(true,  Rational("2") >  Rational("1"))
		assert_equal(false, Rational("1") >  Rational("2"))
	end

	# From the page 656
	# ------------------------------------------------------------------
	# rat <=> numeric -> -1,0,+1, or nil
	# ------------------------------------------------------------------
	# Comparison - Returns -1, 0, or +1 depanding on whether rat is less
	# than, equal to, or greater than numeric. Although Rational's
	# grandparent mixes in Comparaable, Rational does not use that module
	# for performing comparisons, instead implementing the comparison
	# operators explicitly.
	def test_Rational_InstanceMethods_Comparison
		assert_equal(0,  Rational("4/2") <=> Rational("98/49"))
		assert_equal(-1, Rational("3/4") <=> 41)
		assert_equal(0,  Rational("0") <=> 0.0)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat == numeric
	# ------------------------------------------------------------------
	# Returns true if rat has the same value as numeric. Comparisons
	# against integers and rational numbers are exact; comparisons against
	# floats first convert rat to a float.
	def test_Rational_InstanceMethods_Compare2
		assert_equal(true,  Rational("2") == Rational("2"))
		assert_equal(false, Rational("1") == Rational("2"))
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.ceil -> numeric
	# ------------------------------------------------------------------
	# Returns the smallest integer greater than or equal to rat.
	def test_Rational_InstanceMethods_ceil
		assert_equal(4,  Rational("22/7").ceil)
		assert_equal(-3, Rational("-22/7").ceil)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.denominator -> a_number
	# ------------------------------------------------------------------
	# Returns the denominator of rat.
	def test_Rational_InstanceMethods_denominator
		assert_equal(3,   Rational("2/3").denominator)
		assert_equal(365, Rational("343434/365").denominator)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.fdiv(numeric) -> float
	# ------------------------------------------------------------------
	# Returns the floating-point result of divding rat by numeric.
	def test_Rational_InstanceMethods_fdiv
		# assert_equal(11/4, Rational("11/2")/2)
		assert_equal(2.75, Rational("11/2").fdiv(2))
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.floor -> numeric
	# ------------------------------------------------------------------
	# Returns the largest integer less than or equal to rat.
	def test_Rational_InstanceMethods_floor
		assert_equal(3,  Rational("22/7").floor)
		assert_equal(-4, Rational("-22/7").floor)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.numerator
	# ------------------------------------------------------------------
	# Returns the numerator of rat.
	def test_Rational_InstanceMethods_numerator
		assert_equal(2, Rational("2/3").numerator)
		# TODO, assert_equal(1978, Rational("1978/840").numerator)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.quo(numeric) -> numeric
	# ------------------------------------------------------------------
	# Synonym for Rational#/.
	def test_Rational_InstanceMethods_quo
		assert_equal(2.0, Rational("4").quo(2))
		assert_equal(1.0, Rational("4").quo(4))
	end

	# From the page 657
	# ------------------------------------------------------------------
	#          rat.rationalize -> rat
	# rat.rationalize(epsilon) -> rational
	# ------------------------------------------------------------------
	# With no argument, returns rat; otherwise, returns a new Rational
	# with the given precision.
	def test_Rational_InstanceMethods_rationalize
		assert_equal(Rational("884279719003555/281474976710656").to_r, Math::PI.to_r)
		# TODO, Need add some testcases.
		# r.rationalize #=>(884279719003555/281474976710656)
		# r.rationalize(0.01)#=>(22/7)
	end

	# From the page 657
	# ------------------------------------------------------------------
	# rat.round -> numeric
	# ------------------------------------------------------------------
	# Rounds rat to the nearest integer.
	def test_Rational_InstanceMethods_round
		assert_equal(3,  Rational("22/7").round)
		assert_equal(-3, Rational("-22/7").round)
	end

	# From the page 658
	# ------------------------------------------------------------------
	# rat.to_f -> float
	# ------------------------------------------------------------------
	# Returns the floating-point representation of rat.
	def test_Rational_InstanceMethods_to_f
		assert_equal(9.25, Rational("37/4").to_f)
	end

	# From the page 658
	# ------------------------------------------------------------------
	# rat.to_r -> rat
	# ------------------------------------------------------------------
	# Return rat
	def test_Rational_InstanceMethods_to_r
		assert_equal(Rational("2"), Rational("4/2").to_r)
	end

	# From the page 658
	# ------------------------------------------------------------------
	# rat.truncate -> numeric
	# ------------------------------------------------------------------
	# Returns rat truncated to an integer.
	def test_Rational_InstanceMethods_truncate
		assert_equal(3,  Rational("22/7").truncate)
		assert_equal(-3, Rational("-22/7").truncate)
	end

end
