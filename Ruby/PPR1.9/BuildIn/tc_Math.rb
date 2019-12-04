#####################################################################
# File name: tc_Math.rb
# Create date: 2013-10-9 08:42 AM
# Update date: 2013-10-9 11:21 AM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Math < Test::Unit::TestCase

	# Introduction
	# ------------------------------------------------------------------
	# The Math module contains module methods for basic trigonometric
	# and transcendental functions. See class Float on page 513 for a
	# list of constants that define Ruby's floating-point accuracy.
	
	# From the page 562
	def test_Math_ModuleConstants
		assert_equal(2.7182818284590451, Math::E)
		assert_equal(3.1415926535897931, Math::PI)
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.acos(x) -> float
	# ------------------------------------------------------------------
	# Computes the arc cosine of x. Return 0..PI
	def test_Math_ClassMethods_acos
		assert_equal(0, Math.acos(1))
		assert_equal(1.5707963267948966, Math.acos(0))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.acosh(x) -> float
	# ------------------------------------------------------------------
	# Computes the inverse hyperbolic cosine of x.
	def test_Math_ClassMethods_acosh
		assert_equal(0, Math.acosh(1))
		assert_equal(1.7627471740390861, Math.acosh(3))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.asin(x) -> float
	# ------------------------------------------------------------------
	# Computes the arc sine of x. Returns -PI/2 .. PI/2.
	def test_Math_ClassMethods_asin
		assert_equal(1.5707963267948966, Math.asin(1))
		assert_equal(0.52359877559829893, Math.asin(0.5))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.asinh(x) -> float
	# ------------------------------------------------------------------
	# Computes the inverse hyperbolic sine of x.
	def test_Math_ClassMethods_asinh
		assert_equal(0.881373587019543, Math.asinh(1))
		assert_equal(0.48121182505960347, Math.asinh(0.5))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.atan(x) -> float
	# ------------------------------------------------------------------
	# Computes the arc tangent of x. Returns -PI/2 .. PI/2.
	def test_Math_ClassMethods_atan
		assert_equal(0.78539816339744828, Math.atan(1))
		assert_equal(1.1071487177940904, Math.atan(2))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.atanh(x) -> float
	# ------------------------------------------------------------------
	# Computes the inverse hyperbolic tangent of x.
	def test_Math_ClassMethods_atanh
		assert_equal(1.0593061708232432, Math.atanh(0.78539816339744828))
		assert_equal(0.54930614433405489, Math.atanh(0.5))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.atan2(y, x) -> float
	# ------------------------------------------------------------------
	# Computes the arc tangent given y and x. Return -PI .. PI.
	def test_Math_ClassMethods_atan2
		assert_equal(0.78539816339744828, Math.atan2(1,1))
		assert_equal(0.46364760900080609, Math.atan2(1,2))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.cbrt(numeric) -> float
	# ------------------------------------------------------------------
	# Returns the cube root of numberic
	def test_Math_ClassMethods_cbrt
		assert_equal(3, Math.cbrt(27))
		assert_equal(5, Math.cbrt(125))
	end

	# From the page 562
	# ------------------------------------------------------------------
	# Math.cos(x) -> float
	# ------------------------------------------------------------------
	# Computes the cosine of x (expressed in radians). Return -1 .. 1.
	def test_Math_ClassMethods_cos
		assert_equal(0.40808206181339198606226786092764, Math.cos(20))
		assert_equal(0.15425144988758405071866214661421, Math.cos(30))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.cosh(x) -> float
	# ------------------------------------------------------------------
	# Computes the hyperbolic cosine of x (expressed in radians).
	def test_Math_ClassMethods_cosh
		assert_equal(242582597.70489514, Math.cosh(20))
		assert_equal(5343237290762.2314, Math.cosh(30))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.erf(x) -> float
	# ------------------------------------------------------------------
	# Returns the error function of x.
	def test_Math_ClassMethods_erf
		assert_equal(1.0, Math.erf(10))
		assert_equal(1.0, Math.erf(20))
		assert_equal(1.0, Math.erf(30))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.erfc(x) -> float
	# ------------------------------------------------------------------
	# Returns the complementary error function of x.
	def test_Math_ClassMethods_erfc
		assert_equal(2.0884875837625449e-045, Math.erfc(10))
		assert_equal(5.3958656116079012e-176, Math.erfc(20))
		assert_equal(0.0, Math.erfc(30))			
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.exp(x) -> float
	# ------------------------------------------------------------------
	# Returns e^x.
	def test_Math_ClassMethods_exp
		assert_equal(7.38905609893065, Math.exp(2))
		assert_equal(20.085536923187668, Math.exp(3))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.frexp(numeric) -> [fraction, exponent]
	# ------------------------------------------------------------------
	# Returns the normalized fraction (a Float) and exponent (a Fixnum)
	# of numeric.
	def test_Math_InstanceMethods_frexp
		fraction, exponent = Math.frexp(1234)
		assert_equal([0.6025390625, 11], [fraction, exponent])
		assert_equal(1234.0, fraction * 2**exponent)
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.gamma(x) -> float
	# ------------------------------------------------------------------
	# Returns the gamma function. For integral x, gamma(x) approximates
	# factorial(x-1_.
	def test_Math_InstanceMethods_gamma
		assert_equal(1.0, Math.gamma(2))
		assert_equal(2.0, Math.gamma(3))
		assert_equal(6.0, Math.gamma(4))
		assert_equal(784993.6091493163, Math.gamma(10.34))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.hypot(x, y) -> float
	# ------------------------------------------------------------------
	# Returns sqrt(x^2+y^2), the hypotenuse of a right-angled triangle
	# with sides x and y.
	def test_Math_InstanceMethods_hypot
		assert_equal(5.0,  Math.hypot(3, 4))
		assert_equal(13.0, Math.hypot(5, 12))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.ldexp(float, n) -> float
	# ------------------------------------------------------------------
	# Returns the value of float x 2^n
	def test_Math_InstanceMethods_ldexp
		fraction, exponent = Math.frexp(1234)
		assert_equal(1234.0, Math.ldexp(fraction, exponent))
	end

	# From the page 563
	# ------------------------------------------------------------------
	# Math.lgamma(x) -> [float, sign]
	# ------------------------------------------------------------------
	# The first element of the returned array is the natural logarithm
	# of the absolute value of the gamma function of x. The second value
	# is -1 if the gamma function returned a negative number, +1 otherwise.
	def test_Math_InstanceMethods_lgamma
		assert_equal([12.801827480081471, 1], Math.lgamma(10))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.log(numeric<, base=E>) -> float
	# ------------------------------------------------------------------
	# Returns logarithm of numeric. With no base parameter, returns the
	# natural logrith.
	def test_Math_InstanceMethods_log
		assert_equal(2, Math.log(4,2))
		assert_equal(2, Math.log(9,3))
		assert_equal(2, Math.log(25,5))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.log10(numeric) -> float
	# ------------------------------------------------------------------
	# Returns the base 10 logarithm of numeric
	def test_Math_InstanceMethods_log10
		assert_equal(2, Math.log10(100))
		assert_equal(3, Math.log10(1000))
		assert_equal(4, Math.log10(10000))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.log2(numeric) -> float
	# ------------------------------------------------------------------
	# Returns the base 2 logarithm of numeric
	def test_Math_InstanceMethods_log2
		assert_equal(2, Math.log2(2*2))
		assert_equal(3, Math.log2(2*2*2))
		assert_equal(4, Math.log2(2*2*2*2))
		assert_equal(5, Math.log2(2*2*2*2*2))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.sin(numeric) -> float
	# ------------------------------------------------------------------
	# Computes the sine of numeric (expressed in radians). Return -1..1.
	def test_Math_InstanceMethods_sin
		assert_equal(0.0, Math.sin(0))
		# assert_equal(1.0, Math.sin(Math::PI/4.0))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.sinh(float) -> float
	# ------------------------------------------------------------------
	# Computes the hyperbolic sine of numeric (expressed in radians)
	def test_Math_InstanceMethods_sinh
		assert_equal(0.52109530549374738, Math.sinh(0.5))
		assert_equal(0.25261231680816831, Math.sinh(0.25))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.sqrt(float) -> float
	# ------------------------------------------------------------------
	# Returns the non-negative square root of numeric. Raises ArgError if
	# numeric is less than zero.
	def test_Math_InstanceMethods_sqrt
		assert_equal(2, Math.sqrt(4))
		assert_equal(3, Math.sqrt(9))
		assert_equal(4, Math.sqrt(16))
		assert_equal(5, Math.sqrt(25))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.tan(float) -> float
	# ------------------------------------------------------------------
	# Returns the tangent of numeric (expressed in radians).
	def test_Math_InstanceMethods_tan
		assert_equal(-0.14254654307427780, Math.tan(3))
		assert_equal(-0.29100619138474915, Math.tan(6))
	end

	# From the page 564
	# ------------------------------------------------------------------
	# Math.tanh(float) -> float
	# ------------------------------------------------------------------
	# Computes the hyperbolic tangent of numeric (expressed in radians).
	def test_Math_InstanceMethods_tanh
		assert_equal(0.99505475368673046, Math.tanh(3))
		assert_equal(0.99998771165079559, Math.tanh(6))
	end

end
