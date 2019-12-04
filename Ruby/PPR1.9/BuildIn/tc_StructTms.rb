#####################################################################
# File name: tc_StructTms.rb
# Create date: 2013-9-29 17:11 PM
# Update date: 2013-9-29 17:18 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_StructTms < Test::Unit::TestCase
	# From the page 697
	def test_StructTms
		t = Process::times
		assert_equal('Float', t.utime.class.name)
		assert_equal('Float', t.stime.class.name)
		assert_equal('Float', t.cutime.class.name)
		assert_equal('Float', t.cstime.class.name)
	end	
end
