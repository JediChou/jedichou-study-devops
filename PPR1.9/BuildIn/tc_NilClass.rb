#####################################################################
# File name: tc_NilClass.rb
# Create date: 2013-10-8 11:30 AM
# Update date: 2013-10-8 
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_NilClass < Test::Unit::TestCase
	
	# NilClass
	# ------------------------------------------------------------------
	# The class of the singleton object nil.
	
	# From the page 589
	# ------------------------------------------------------------------
	# nil & obj -> false
	# ------------------------------------------------------------------
	# And - Return false. Because obj is an argument to a method call, it
	# is always evaluated; there is no short-circuit evaluation in this
	# case.
	def test_NilClass_InstanceMethods_And
		assert_equal(nil, nil && "logical and")
		assert_equal(false, nil & "and")
	end

	# From the page 589
	# ------------------------------------------------------------------
	# nil ^ obj -> true or false
	# ------------------------------------------------------------------
	# Exclusive Or - Returns false is obj is nil or false and returns
	# true otherwise.
	def test_NilClass_InstanceMethods_ExclusiveOr
		assert_equal(true, nil ^ "obj")
		assert_equal(false, nil ^ nil)
	end

	# From the page 589
	# ------------------------------------------------------------------
	# nil | obj -> true or false
	# ------------------------------------------------------------------
	# Or - Returns false is obj is nil or false and returns true otherwise.
	def test_NilClass_InstanceMethods_Or
		assert_equal(false, nil | false)
		assert_equal(true, nil | 99)
	end

	# From the page 589
	# ------------------------------------------------------------------
	# nil.nil? -> true
	# ------------------------------------------------------------------
	# Always returns true.
	def test_NilClass_InstanceMethods_Nil?
		assert_equal(true, nil.nil?)
	end

	# From the page 589
	# ------------------------------------------------------------------
	# int.rational(eps=nil) -> Rational(0)
	# ------------------------------------------------------------------
	# Returns Rational("0"). The argument is always ignored.
	def test_NilClass_InstanceMethod_rationalize
		# TODO, undefined method 'rationalize' under ruby 1.9.1p430 
		# assert_equal((0/1), nil.rationalize)
	end

	# From the page 589
	# ------------------------------------------------------------------
	# nil.to_a -> []
	# ------------------------------------------------------------------
	# Always returns an empty array.
	def test_NilClass_InstanceMethod_to_a
		assert_equal([], nil.to_a)
	end

	# From the page 589
	# ------------------------------------------------------------------
	# nil.to_c -> Complex(0,0)
	# ------------------------------------------------------------------
	# Always returns the origin of the complex plane.
	def test_NilClass_InstanceMethod_to_c
		assert_equal(Complex(0,0), nil.to_c)
	end

	# From the page 590
	# ------------------------------------------------------------------
	# nil.to_f -> 0.0
	# ------------------------------------------------------------------
	# Always returns zero.
	def test_NilClass_InstanceMethod_to_f
		assert_equal(0.0, nil.to_f)
	end

	# From the page 590
	# ------------------------------------------------------------------
	# nil.to_h -> {}
	# ------------------------------------------------------------------
	# Always returns an empty hash.
	def test_NilClass_InstanceMethod_to_h
		# TODO, New in 2.0
		# assert_equal({}, nil.to_h)
	end

	# From the page 590
	# ------------------------------------------------------------------
	# nil.to_i -> 0
	# ------------------------------------------------------------------
	# Always returns zero.
	def test_NilClass_InstanceMethod_to_i
		assert_equal(0, nil.to_i)
	end

	# From the page 590
	# ------------------------------------------------------------------
	# nil.to_r -> Rational(0, 1)
	# ------------------------------------------------------------------
	# Always returns zero as a rational number.
	def test_NilClass_InstanceMethod_to_r
		assert_equal(Rational(0,1), nil.to_r)
	end

	# From the page 590
	# ------------------------------------------------------------------
	# nil.to_s -> ""
	# ------------------------------------------------------------------
	# Always returns the empty string.
	def test_NilClass_InstanceMethod_to_s
		assert_equal("", nil.to_s)
	end

end
