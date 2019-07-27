require 'test/unit'

class TC_TrueAndFalse < Test::Unit::TestCase
	def test1
		assert_equal "".empty?, true
		assert_equal "AAA".empty?, false
	end

	def test2
		assert_equal /Ruby/ =~ "Ruby", 0
		assert_equal /Ruby/ =~ "Diamond", nil
	end
end

