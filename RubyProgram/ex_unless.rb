require 'test/unit'

class TC_UnlessCondition < Test::Unit::TestCase

	def test_unless
		assert_equal unlesstest(10, 20), "condition 1"
        assert_equal unlesstest(20, 10), "condition 2"
	end
       
    def unlesstest(a, b)
        unless a > b
            return "condition 1"
        else
            return "condition 2"
        end
    end
    
end
