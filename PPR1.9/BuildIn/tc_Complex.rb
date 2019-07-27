#####################################################################
# File name: tc_Complex.rb
# Create date: 2013-9-27 15:14 PM
# Update date: 2013-9-29 11:32 AM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_Complex < Test::Unit::TestCase

	# From the page 451
	# Complex introduce 
	def test_Complex_Introduce
		assert_equal("Complex", Complex(2,3).class.name)
		assert_equal(Complex("2+3i"), Complex(2,3))
	end

	# From the page 451
	# ------------------------------------------------------------------
	# Class Constants - Complex::I, The imaginary unit.
	def test_Complex_ClassConstants
		assert_equal(Complex(0,1), Complex::I)
	end

	# From the page 451
	# ------------------------------------------------------------------
	# Complex.polar(magnitude, angle) -> complex
	# ------------------------------------------------------------------
	# Returns the complex number represented by the given polar coordinates
	def test_Complex_ClassMethods_polar
		assert_equal(Complex("1.0794265511251584+0.5896934124831696i"), Complex.polar(1.23, 0.5))
		# assert_equal(Complex("6.123233995736766e-17+1.0i"), Complex.polar(1, Math::PI/2))
	end

	# From the page 451
	# ------------------------------------------------------------------
	# Complex.rect(read, imag) -> complex
	# ------------------------------------------------------------------
	# Returns the complex number represented by the given real and
	# imaginary parts.
	def test_Complex_ClassMethods_rect
		assert_equal(Complex("1.23+0.5i"), Complex.rect(1.23, 0.5))
	end

	# From the page 451
	# ------------------------------------------------------------------
	# Complex.rectangular(read, imag) -> complex
	# ------------------------------------------------------------------
	# Synonym for Complex.rect
	def test_Complex_ClassMethods_rect
		assert_equal(Complex("1.23+0.5i"), Complex.rectangular(1.23, 0.5))
	end

	# From the page 452
	# ------------------------------------------------------------------
	# Arithmetic operations
	# ------------------------------------------------------------------
	# Performs various arithmetic operations on complex.
	# complex  +  numeric  Addition
	# complex  -  numeric  Subtraction
	# complex  *  numeric  Multiplication
	# complex  /  numeric  Divison
	# complex **  numeric  Exponentiation
	# complex -@  Unary minus
	# complex -+  Unary plus
	def test_Complex_InstanceMethods_ArithmeticOperations
		assert_equal(Complex("3+2i"), Complex("1+1i") + Complex("2+1i"))
		assert_equal(Complex("2+i"), Complex("3+2i") - Complex("1+i"))
		assert_equal(Complex("0+24i"), Complex("3+3i") * Complex("4+4i"))
		assert_equal(Complex("3+3i"), Complex("9+9i") / 3 )
		assert_equal(3, Complex("9+9i") / Complex("3+3i") )
		assert_equal(Complex("0+8i"), Complex("2+2i") ** 2)
		assert_equal(Complex("0+8i"), Complex("2+2i") * Complex("2+2i"))
		# TODO, must be add testcase of "-@, -+"
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex == other -> true or false
	# ------------------------------------------------------------------
	# Returns true if complex does equals other, converting other to a
	# complex number if necessary.
	def test_Complex_InstanceMethods_equals
		assert_equal(true,  Complex::I == Complex(0, 1))
		assert_equal(false, Complex::I == Complex(1, 0))
		assert_equal(true,  Complex(1,0) == 1)
		assert_equal(false, Complex(1,0) == "1")
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex.abs -> number
	# ------------------------------------------------------------------
	# Synonym for Complex#magnitude.
	def test_Complex_InstanceMethods_abs
		assert_equal(5, Complex("3+4i").abs)
		assert_equal(5, Complex(3,4).abs)
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex.abs2 -> number
	# ------------------------------------------------------------------
	# Returns the square of the absolute value (magnitude) of complex.
	def test_Complex_InstanceMethods_abs2
		assert_equal(1, Complex::I.abs2)
		assert_equal(2, Complex(1,1).abs2)
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex.angle -> number
	# ------------------------------------------------------------------
	# Returns the angle between the x-axis and a line from the origin to
	# complex. By convention, Complex(0,0).angle} is 0.
	def test_Complex_InstanceMethods_angle
		assert_equal(0.0, Complex(1, 0).angle)
		assert_equal(0.7853981633974483, Complex(1,1).angle)
		assert_equal(1.5707963267948966, Complex(0,1).angle)
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex.arg -> number
	# ------------------------------------------------------------------
	# Synonym for Complex#angle
	def test_Complex_InstanceMethods_angle
		assert_equal(0.0, Complex(1, 0).arg)
		assert_equal(0.7853981633974483, Complex(1,1).arg)
		assert_equal(1.5707963267948966, Complex(0,1).arg)
	end

	# From the page 452
	# ------------------------------------------------------------------
	# complex.conj -> a_complex
	# ------------------------------------------------------------------
	# Synonym for Complex#conjugate
	def test_Complex_InstanceMethods_conj
		assert_equal(Complex("0-1i"), Complex::I.conj)
		assert_equal(Complex("1-1i"), Complex(1,1).conj)
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.conjugate -> a_complex
	# ------------------------------------------------------------------
	# Returns the conjugate of complex (the reflection of complex around
	# the x-axis).
	def test_Complex_InstanceMethods_conjugate
		assert_equal(Complex("0-1i"), Complex::I.conjugate)
		assert_equal(Complex("1-1i"), Complex(1,1).conjugate)
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.denominator -> number
	# ------------------------------------------------------------------
	# Returns the lowest common multiple of the denominators of the real
	# and imaginary parts of complex.
	def test_Complex_InstanceMethods_denominator
		assert_equal(12, Complex("1/3+1/4i").denominator)
		assert_equal(1, Complex(-2, 4).denominator)
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.eql(other) -> true or false
	# ------------------------------------------------------------------
	# Returns true only if other is a complex number with real and
	# imaginary parts eql? to complex's.
	def test_Complex_InstanceMethods_eql?
		assert_equal(true,  Complex(1,0).eql?(Complex(1,0)))
		assert_equal(false, Complex(1,0).eql?(Complex(1.0,0)))
		assert_equal(false, Complex(1,0).eql?(1))
		assert_equal(true,  Complex(1,0) == Complex(1,0))
		assert_equal(true,  Complex(1,0) == Complex(1.0, 0))
		assert_equal(true,  Complex(1,0) == 1)
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.fdiv(other) -> a_complex
	# ------------------------------------------------------------------
	# Returns complex / other after converting the real and imaginary
	# parts of complex to floats. (Contrast with Complex#quo.)
	def test_Complex_InstanceMethods_fdiv
		c1 = Complex(1, 2)
		c2 = Complex(2, 2)
		assert_equal(Complex("3/4+1/4i"), c1/c2)
		# TODO, why? assert_equal(Complex(0.75,0.25), c1.fdiv(c2))
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.imag -> number
	# ------------------------------------------------------------------
	# Returns the imaginary part of complex.
	def test_Complex_InstanceMethods_imag
		assert_equal(-3, Complex(2, -3).imag)
		assert_equal(-3, Complex("2-3i").imag)
	end

	# From the page 453
	# ------------------------------------------------------------------
	# complex.imaginary -> number
	# ------------------------------------------------------------------
	# Synonym for Complex#imag.
	def test_Complex_InstanceMethods_imaginary
		assert_equal(-3, Complex(2, -3).imaginary)
		assert_equal(-3, Complex("2-3i").imaginary)
	end

	# From the page 453-454
	# ------------------------------------------------------------------
	# complex.magnitude -> int or float
	# ------------------------------------------------------------------
	# Returns the magnitude of complex (the distance of complex from the
	# origin of the number line). The positive square root of real^2 +
	# imag^2
	def test_Complex_InstanceMethods_magnitude
		assert_equal(1.4142135623730951, Complex(1,1).magnitude)
		assert_equal(5.0, Complex(3, 4).magnitude)
		assert_equal(1, Complex::I.magnitude)
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.numerator -> a_complex
	# ------------------------------------------------------------------
	# Returns the numerator, treating the real and complex parts of
	# complex as fractions to be combined over a common denominator.
	def test_Complex_InstanceMethods_numerator
		c = Complex('2/3+3/4i')
		assert_equal(Complex('8+9i'), c.numerator)
		assert_equal(12, c.denominator)
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.phase -> [magnitude, angle]
	# ------------------------------------------------------------------
	# Returns the phase angle of complex (the angle between the positive
	# x-axis and the line from the origin to (real, imag)), measured in
	# radians.
	def test_Complex_InstanceMethods_phase
		assert_equal(0.9272952180016122, Complex(3,4).phase)
		assert_equal(2.214297435588181, Complex(-3,4).phase)
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.polar -> [magnitude, angle]
	# ------------------------------------------------------------------
	# Returns complex as polar coordinates.
	def test_Complex_InstanceMethods_polar
		assert_equal([1.4142135623730951, 0.7853981633974483], Complex(1,1).polar)
		# TODO, why? assert_equal([3.605551275463989, -2.158798930342464], Complex(-2,-3).polar)
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.quo(other) -> a_complex
	# ------------------------------------------------------------------
	# Returns complex / other after converting the real and imaginary
	# parts of complex to rational numbers. (Contrast with Complex#fdiv.)
	def test_Complex_InstanceMethods_quo
		c1 = Complex(1, 2)
		c2 = Complex(2, 2)
		assert_equal(Complex("3/4+1/4i"), c1/c2)
		assert_equal(Complex("3/4+1/4i"), c1.quo(c2))
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.rationalize(eps=nil) -> rational
	# ------------------------------------------------------------------
	# Returns the real part of complex as a rational number, raising an
	# exception if the imaginary part is not zero. The argument is always
	# ignord. Effectively a synonym for Complex.to_r.
	def test_Complex_InstanceMethods_rationalize
		assert_equal(2.5, Complex(2.5, 0))
	end

	# From the page 454
	# ------------------------------------------------------------------
	# complex.rect -> [complex.real, complex.imag]
	# ------------------------------------------------------------------
	# Returns an array containing the real and imaginary components for
	# complex.
	def test_Complex_InstanceMethods_rect
		assert_equal([0,1], Complex::I.rect)
		assert_equal([2,3], Complex('2+3i').rect)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.rectangular -> [complex.real, complex.imag]
	# ------------------------------------------------------------------
	# Synonym for Complex#rect
	def test_Complex_InstanceMethods_rectangular
		assert_equal([0,1], Complex::I.rectangular)
		assert_equal([2,3], Complex('2+3i').rectangular)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.real -> number
	# ------------------------------------------------------------------
	# Returns the real part of complex.
	def test_Complex_InstanceMethods_real
		assert_equal(2, Complex(2,3).real)
		assert_equal(0, Complex::I.real)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.real? -> false
	# ------------------------------------------------------------------
	# Complex numbers are never real numbers (even if their imaginary
	# part is zero).
	def test_Complex_InstanceMethods_real?
		assert_equal(false, Complex(1,1).real?)
		assert_equal(false, Complex(1,0).real?)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.to_f -> float
	# ------------------------------------------------------------------
	# Returns the real part of complex as a float, raising an exception
	# if the imaginary part is not zero.
	def test_Complex_InstanceMethods_to_f
		assert_equal(2.0, Complex(2, 0).to_f)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.to_i -> integer
	# ------------------------------------------------------------------
	# Returns the real part of complex as an integer, raising an exception
	# if the imaginary part is not zero.
	def test_Complex_InstanceMethods_to_i
		assert_equal((5/2), Complex(2.5, 0).to_i)
	end

	# From the page 455
	# ------------------------------------------------------------------
	# complex.to_r -> rational
	# ------------------------------------------------------------------
	# Returns the real part of complex as rational number, raising an
	# exception if the imaginary part is not zero.
	def test_Complex_InstanceMethods_to_r
		assert_equal(Rational('5/2'), Complex(2.5, 0).to_r)
	end

end
