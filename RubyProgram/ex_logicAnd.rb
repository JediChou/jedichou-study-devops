require 'test/unit'

class TC_LogicOperator < Test::Unit::TestCase
	def test_logicAdd
		assert (1 && 1)
		assert (2 && 1)
		assert !(nil && 0)
		assert (0 && 0)
        assert !(nil && nil)
	end
    
    def test_logicOr
        assert (1 || 0)
        assert (2 || 0)
        assert (0 || 1)
        assert (0 || 2)
        assert (nil || 1)
        assert (1 || nil)
    end
    
    def test_getNi
        assert !false
        assert !nil
        assert !!"string"
        assert !!10
    end
end
