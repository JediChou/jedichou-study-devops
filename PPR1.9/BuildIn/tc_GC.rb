#####################################################################
# File name: tc_GC.rb
# Create date: 2013-10-8 16:26 PM
# Update date: 
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'
include GC

class TC_GC < Test::Unit::TestCase
	
	# Introduction
	# ------------------------------------------------------------------
	# The GC module provides an interface to Ruby's mark and sweep
	# garbage collection mechanism. Some of the underlying methods are
	# also available via ObjectSpace module, described later on page 631.


	# From the page 517
	# ------------------------------------------------------------------
	# GC.count -> int
	# ------------------------------------------------------------------
	# Returns a count of the number of times GC has run int current
	# process.
	def test_GC_ClassMethods_count
		# Notice, under windows xp the result is 5.
		assert_equal(5, GC.count)
		
		res = ""
		10_000.times { res += "wibble" }
		assert_equal(42, GC.count)
	end

	# From the page 517
	# ------------------------------------------------------------------
	# GC.disable -> true or false
	# ------------------------------------------------------------------
	# Disables garbage collection, returning true if garbage collection
	# was already disabled.
	def test_GC_ClassMethods_disable
		assert_equal(false, GC.disable)
		assert_equal(true,  GC.disable)
	end

	# From the page 517
	# ------------------------------------------------------------------
	# GC.enable -> true or false
	# ------------------------------------------------------------------
	# Enables garbage collection, returning true if garbage collection
	# was disabled.
	def test_GC_ClassMethods_enable
		# TODO, will add some test cases.
		# GC.disable # => false
		# GC.enable  # => true
		# GC.enable  # => false
	end

	# From the page 517
	# ------------------------------------------------------------------
	# GC.start -> nil
	# ------------------------------------------------------------------
	# Initiates garbage collection, unless manually disabled.
	def test_GC_ClassMethods_start
		assert_equal(nil, GC.start)
	end

	# From the page 517
	# ------------------------------------------------------------------
	# GC.stat -> stats_hash
	# ------------------------------------------------------------------
	# Returns a hash containing GC statistics. The contents of this hash
	# are implementation dependent. The method may not be present in all
	# Ruby implementations.
	def test_GC_ClassMethods_stat
		# TODO, undefined method 'stat' for GC:Module under ruby 1.9.1p430
		# assert_equal("hash", GC.stat)
	end

	# From the page 517
	# ------------------------------------------------------------------
	# GC.stress -> true or false
	# ------------------------------------------------------------------
	# Returns the current value of the stress flag (see GC.stress=).
	def test_GC_ClassMethods_stress
		# TODO, need add some test cases.
	end

	# From the page 518
	# ------------------------------------------------------------------
	# GC.stress == true or false -> true or false
	# ------------------------------------------------------------------
	# Ruby will normally run garbage collection periodically. Setting
	# the stress flag to true forces garbage collection to occur every
	# time Ruby allocates a new object. This is typically used only for
	# testing extensions (and Ruby itself).
	def test_GC_ClassMethods_stree=
		assert_equal(false, GC.stress)
	end

	# From the page 518
	# ------------------------------------------------------------------
	# garbage_collect -> nil
	# ------------------------------------------------------------------
	# Equivalent to GC.start.
	def test_GC_InstanceMethods_garbage_collect
		assert_equal(nil, garbage_collect)
	end

end
