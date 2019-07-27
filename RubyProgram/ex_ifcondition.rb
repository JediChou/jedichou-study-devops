require 'test/unit'

class TC_IfCondition < Test::Unit::TestCase

	def test_ifcondition
		assert_equal iftest(10, 20), "b great"
        assert_equal iftest(20, 10), "b less"
        assert_equal iftest(10, 10), "equal"
	end
       
    def iftest(a, b)
        if b > a
            return "b great"
        elsif b == a
            return "equal"
        else
            return "b less"
        end
    end
    
end
