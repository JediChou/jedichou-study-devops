#####################################################################
# File name: tc_Comparable.rb
# Create date: 2013-10-8 12:03 PM
# Update date: 2013-10-8 13:05 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Comparable < Test::Unit::TestCase

	# Comparable - Introduction
	####################################################################
	# The Comparable mixin is used by classes whose objects may
	# be ordered. The class must define the <=> operator, which
	# compares the receiver against another object, returning -1,
	# 0, or +1 depending on whether the receiver is less than,
	# equal to, or greater than the other object. Comparable uses
	# <=> to implement the conventional comparison operators (<,
	# <=, ==, >=, and >) and the method between?.
	####################################################################
	def test_Comparable_Instroduction
		s1 = CompareOnSize.new("Z")
		s2 = CompareOnSize.new([1,2])
		s3 = CompareOnSize.new("XXX")

		assert_equal(true, s1 < s2)
		assert_equal(true, s2.between?(s1, s3))
		assert_equal(false, s3.between?(s1, s2))
		# assert_equal(["Z",[1,2],"XXX"], [s3,s2,s1].sort)
	end
	
	# From the page 450
	# ------------------------------------------------------------------
	#  obj < other_object -> true or false
	# obj <= other_object -> true or false
	# obj == other_object -> true or false
	# obj >= other_object -> true or false
	#  obj > other_object -> true or false
	# ------------------------------------------------------------------
	# Compares two objects based on the receiver's <=> method.
	def test_Comparable_InstanceMethod_Comparisons
		# return true
		assert_equal(true, 1 < 2)
		assert_equal(true, 2 <= 2)
		assert_equal(true, 2 == 2)
		assert_equal(true, 2 >= 2)
		assert_equal(true, 2 > 1)

		# return false
		assert_equal(false, 1 > 2)
		assert_equal(false, 2 <= 1)
		assert_equal(false, 1 == 2)
		assert_equal(false, 2 <= 1)
		assert_equal(false, 2 < 1)
	end
	
	# From the page 450
	# ------------------------------------------------------------------
	# obj.between?(min,max) -> true or false
	# ------------------------------------------------------------------
	# Returns false if obj <=> is less than zero or if obj <=> max is
	# greater than zero; return true otherwise.
	def test_Comparable_InstanceMethod_between?
		assert_equal(true,  3.between?(1,5))
		assert_equal(false, 6.between?(1,5))
		assert_equal(true,  'cat'.between?('ant','dog'))
		assert_equal(false, 'gnu'.between?('ant','dog'))
	end

end

## for methods (test_Comparable_Instroduction)
class CompareOnSize
	include Comparable
	attr :str
	def <=>(other)
		str.length <=> other.str.length
	end
	def initialize(str)
		@str = str
	end
end
