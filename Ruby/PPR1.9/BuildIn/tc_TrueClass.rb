#####################################################################
# File name: tc_TrueClass.rb
# Create date: 2013-9-29 11:35 PM
# Update date: 2013-9-29 11:48 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_TrueClass < Test::Unit::TestCase

	# From the page 725
	# ------------------------------------------------------------------
	# true & obj -> true or false
	# ------------------------------------------------------------------
	# And - Returns false if obj is nil or false and returns true
	# otherwise.
	def test_TrueClass_InstanceMethods_and
		assert_equal(true, true & true)
		assert_equal(false, true & false)
		assert_equal(false, false & true)
	end

	# From the page 725
	# ------------------------------------------------------------------
	# true ^ obj -> true or false
	# ------------------------------------------------------------------
	# Exclusive Or - Returns true if obj is nil or false and returns
	# false otherwise.
	def test_TrueClass_InstanceMethods_ExclusiveOr
		assert_equal(false, true ^ true)
		assert_equal(true, true ^ false)
		assert_equal(true, false ^ true)
	end

	# From the page 725
	# ------------------------------------------------------------------
	# true | obj -> true
	# ------------------------------------------------------------------
	# Or - Returns true. Because obj is an argument to a method call, it
	# is always evaluated; shortcircuit evaluation is not performed in
	# this case.
	def test_TrueClass_InstanceMethods_or
		assert_equal(true, false | true)
		assert_equal(true, true | false)
		assert_equal(true, true | true)
		assert_equal(false, false | false)
	end

end
