#####################################################################
# File name: tc_range.rb
# Create date: 2013-9-23 17:20 AM
# Update date: 2013-9-26 10:51 AM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_Range < Test::Unit::TestCase
	
	# From the 650 - Introduce Range
	def test_Range_Introduce
		assert_equal([], (-1..-5).to_a)
		assert_equal([-5,-4,-3,-2,-1], (-5..-1).to_a)
		assert_equal(['a','b','c','d','e'], ('a'..'e').to_a)
		assert_equal(['a','b','c','d'], ('a'...'e').to_a)
	end

	# From the page 651
	# ------------------------------------------------------------------
	# Range.new(start, end, exclusive=false) -> rng
	# ------------------------------------------------------------------
	# Constructs a range using the given start and end. If the third
	# parameter is omitted or is false, the range will include the end
	# object; otherwise, it will be excluded.
	def test_Range_ClassMethods_new
		a = Range.new(-1, -5); assert_equal('Range', a.class.name)
		b = Range.new(-5, -1); assert_equal('Range', b.class.name)
		c = Range.new('a', 'e');  assert_equal('Range', c.class.name)
		d = Range.new('a', 'e', false); assert_equal('Range', d.class.name)
	end

	# From the page 651
	# ------------------------------------------------------------------
	# rng - obj -> true or false
	# ------------------------------------------------------------------
	# Returns true if obj is a range whose beginning and end the same as
	# those in rng (compared using ==) and whose exclusive flg is the
	# same as rng.
	def test_Range_InstanceMethods_compare
		assert_equal(true,  (1..3) == Range.new(1,3))
		assert_equal(false, (1..3) == (2..4))
	end

	# From the page 651
	# ------------------------------------------------------------------
	# rng === val -> true or false
	# ------------------------------------------------------------------
	# If rng excludes its end, returns rng.start <= val <rng.end. If rng
	# is inclusive, returns rng.start <= val <= rng.end. Note that this
	# implies that val need not be a member of the range itself (for
	# example, a float fall between the start and end values of a range
	# of integers). Implemented by calling include? Conveniently, the
	# === operator is used by case statements.
	def test_Range_InstanceMethods_excludes
		assert_equal(true,  (1..10) === 5)
		assert_equal(false, (1..10) === 15)
		assert_equal(true,  (1..10) === 3.14159)
		assert_equal(true,  ('a'..'j') === 'c')
		assert_equal(false, ('a'..'j') === 'z')
	end

	# From the page 651
	# ------------------------------------------------------------------
	# rng.begin -> obj
	# ------------------------------------------------------------------
	# Returns the first object of rng.
	def test_Range_InstanceMethods_begin
		assert_equal('a', ('a'..'b').begin)
		assert_equal('a', ('a'...'b').begin)
		assert_equal(1, (1..100).begin)
		assert_equal(1, (1...100).begin)
	end

	# From the page 651
	# ------------------------------------------------------------------
	# rng.bsearch {|val| ...} -> obj or nil>
	# ------------------------------------------------------------------
	# The same basic functionality as Array#bsearch. However, the range
	# variant is typeically used to search for something outside the 
	# range itself. Fox example, the range values could be used as a
	# parameter to a function, or to index into some other collection.
	# Remember though that the value returned by that function or collection
	# must increase as its parameter increases.
	# ------------------------------------------------------------------
	# New in 2.0
	# TODO, Add some testcases.
	
	# From the page 652
	# ------------------------------------------------------------------
	# rng.cover?(obj) -> true or false
	# ------------------------------------------------------------------
	# Returns true if obj lies between the start and end of the range.
	# For ranges defined with min..max, this means min <= obj <= max. For
	# ranges defined with min...max, it manes min <= obj <max.
	def test_Range_InstanceMethods_cover?
		assert_equal(false, (1..10).cover?(0))
		assert_equal(true,  (1..10).cover?(5))
		assert_equal(true,  (1..10).cover?(9.5))
		assert_equal(true,  (1..10).cover?(10))
		assert_equal(false, (1...10).cover?(10))
	end

	# From the page 652
	# ------------------------------------------------------------------
	# rng.each {|i|...} -> rng
	# ------------------------------------------------------------------
	# Iterates over the elements rng, passing each in turn to the block.
	# Successive elements are generated using the succ method.
	def test_Range_InstanceMethods_each
		result = []
		(11..15).each do |elt|
			result.push(elt)
		end
		assert_equal([11,12,13,14,15], result)
	end

	# From the page 652
	# ------------------------------------------------------------------
	# rng.end -> obj
	# ------------------------------------------------------------------
	# Returns the object that defines the end of rng.
	def test_Range_InstanceMethods_end
		assert_equal(10, (1..10).end)
		assert_equal(10, (1...10).end)
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.eql?(obj) -> true or false
	# ------------------------------------------------------------------
	# Returns true if obj is a range whose beginning and end are the the
	# same as those in rng (compared using eql?) and whose exclusive flag
	# is the same as rng.
	def test_Range_InstanceMethods_eql?
		assert_equal(true , (1..10).eql?(Range.new(1,10)))
		assert_equal(false, (1..10).eql?([1..10]))
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.exclude_end? -> true or false
	# ------------------------------------------------------------------
	# Returns true if rng excludes its and value.
	def test_Range_InstanceMethods_exclude_end?
		# TODO, need add some testcases.
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.first(n=1) -> obj or array
	# ------------------------------------------------------------------
	# Returns the first (or first n) elements of rng.
	def test_Range_InstanceMethods_first
		assert_equal('aa', ('aa'..'bb').first)
		assert_equal(['aa','ab','ac','ad','ae'], ('aa'..'bb').first(5))
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.include?(val) -> true or false
	# ------------------------------------------------------------------
	# Returns true if val is one of the values in rng (that is, is
	# Range#each would return val at some point). If the range is defined
	# to span numbers, this method returns true if value lies between the
	# start and end of the range, even if it is not actually a member (
	# that is, it has the same behavior as Range#cover?). Otherwise, the
	# parameter must be a member of the range.
	def test_Range_InstanceMethods_include?
		r = 1..10
		assert_equal(true, r.include?(5))
		assert_equal(true, r.include?(5.5))
		assert_equal(true, r.include?(10))

		r = 1...10
		assert_equal(false, r.include?(10))

		r = 'a'..'z'
		assert_equal(true,  r.include?('b'))
		assert_equal(false, r.include?('ruby'))
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.last(n=1) -> obj or array
	# ------------------------------------------------------------------
	# Returns the last (or last n) elements of rng.
	def test_Range_InstanceMethods_last
		assert_equal('bb', ('aa'..'bb').last)
		assert_equal(['ax','ay','az','ba','bb'], ('aa'..'bb').last(5))
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.max -> obj
	# rng.max {|a,b|...} -> obj
	# ------------------------------------------------------------------
	# Returns the maximum value in the range. The block is used to compare
	# values if present.
	def test_Range_InstanceMethods_max
		assert_equal(2, (-3..2).max)
		assert_equal(-3, (-3..2).max {|a,b| a*a <=> b*b})
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.member?(val) -> true or false
	# ------------------------------------------------------------------
	# Synonym for Range#include?.
	def test_Range_InstanceMethods_member?
		r = 1..10
		assert_equal(true, r.member?(5))
		assert_equal(true, r.member?(5.5))
		assert_equal(true, r.member?(10))

		r = 1...10
		assert_equal(false, r.member?(10))

		r = 'a'..'z'
		assert_equal(true,  r.member?('b'))
		assert_equal(false, r.member?('ruby'))
	end

	# From the page 653
	# ------------------------------------------------------------------
	#            rng.min -> obj
	# rng.min {|a,b|...} -> obj
	# ------------------------------------------------------------------
	# Returns the minimum value in the range. The block is used to compare
	# values if present.
	def test_Range_InstanceMethods_min
		assert_equal(-3, (-3..2).min)
		assert_equal(0,  (-3..2).min {|a,b| a*a <=> b*b})
	end

	# From the page 653
	# ------------------------------------------------------------------
	# rng.size -> int or nil
	# ------------------------------------------------------------------
	# Returns the number of elements in rng. In ruby 2.0 only works for
	# ranges of integers
	def test_Range_InstanceMethods_size
		# New in 2.0!
		# assert_equal(26, (1..26).size)
	end

	# From the page 655
	# ------------------------------------------------------------------
	# rng.step(n=1)<{|obj|...}> -> rng or enum
	# ------------------------------------------------------------------
	# Iterates over rng, passing each nth element to the block. If the
	# range contains numbers, addition by one is used to generate
	# successive elements. Otherwise, step invokes succ to iterate
	# through range elements. If no block is given, an enumerator is
	# returned.
	def test_Range_InstanceMethods_step
		assert_equal([1,2,3,4,5], (1..5).step(1).to_a)
		assert_equal([1,3,5], (1..5).step(2).to_a)
		assert_equal([1.0,2.5,4.0], (1..5).step(1.5).to_a)
		assert_equal([1.0,2.0,3.0,4.0,5.0], (1.0..5.0).step(1).to_a)
		assert_equal([1.0,3.0,5.0], (1.0..5.0).step(2).to_a)
		assert_equal([1.0,2.5,4.0], (1.0..5.0).step(1.5).to_a)
	end

end
