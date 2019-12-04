#####################################################################
# File name: tc_Fiber.rb
# Create date: 2013-10-8 16:10 PM
# Update date: 2013-10-8 16:24 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Fiber < Test::Unit::TestCase

	# From the page 487
	# ------------------------------------------------------------------
	# A fiber is a lightweight asymetrical coroutine. Code in a fiber is
	# created in a suspended state. It runs when resumed and can suspend
	# itself (passing a value back to the code that resumed it). There is
	# a full description of fibers in Section 12.1 Fibers, on page 161.
	def test_Fiber_Introduction
		result = ""
		fibonaccis = Fiber.new do
			n1 = n2 = 1
			loop do
				Fiber.yield n1
				n1, n2 = n2, n1+n2
			end
		end
		10.times { result += fibonaccis.resume.to_s }
		assert_equal("11235813213455", result)
	end

	# From the page 487
	# ------------------------------------------------------------------
	# Fiber.new {...} -> fiber
	# ------------------------------------------------------------------
	# new - Uses the block as a new, suspended fiber.
	def test_Fiber_ClassMethods_new
		# TODO, need add a test cases.
	end

	# From the page 487
	# ------------------------------------------------------------------
	# Fiber.yield(<val>*) -> obj
	# ------------------------------------------------------------------
	# yield -> Suspends execution of the current fiber. Any parameters
	# will be returned as the value of the resume call that awoke the
	# fiber. Similarly, any values passed to resume will become the return
	# value of the subsequent yield.
	def test_Fiber_ClassMethods_yield
		# TODO, need add a test cases.
	end

	# From the page 487
	# ------------------------------------------------------------------
	# fiber.resume(<val>*) -> obj
	# ------------------------------------------------------------------
	# resume - Resumes fiber. See Fiber.yield for a discussion and example
	# of parameter passing. It is an error to resume a fiber that is being
	# used as a coroutine (one that calls transfer). See Fiber, on page 755.
	def test_Fiber_InstanceMethod_resume
		# TODO, need add a test cases.
	end

end
