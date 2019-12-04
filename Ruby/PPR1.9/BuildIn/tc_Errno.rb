#####################################################################
# File name: tc_Errno.rb
# Create date: 2013-10-8 15:06 PM
# Update date: 
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Errno < Test::Unit::TestCase
	
	# From the page 482
	# --------------------------------------------------------------
	# The integer operating system error number corresponding to a
	# particular error is available as the class constant Errno::
	# error::Errno.
	def test_Errno_Introduction
		assert_equal(13, Errno::EACCES::Errno)
		# Notices: result is 35 on the book
		assert_equal(11, Errno::EAGAIN::Errno)
		assert_equal(4,  Errno::EINTR::Errno)
	end

	# From the page 482
	# ------------------------------------------------------------------
	# The full list of operating system errors on your particular
	# platform is available as the constants of Errno. Any user-defined
	# exception in this module (including subclasses of existing exceptions)
	# must also define an Errno constant.
	def test_Errno_Introduction2
		assert_equal([:NOERROR, :EPERM, :ENOENT, :ESRCH, :EINTR], 
					 Errno.constants[0..4])
	end

end
