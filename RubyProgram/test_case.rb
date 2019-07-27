require 'test/unit'

class TC_Case < Test::Unit::TestCase 
    
    def test_CaseReturn
        assert_equal returnCaseResult("P"), "choice-1", "case 1"
        assert_equal returnCaseResult("IMG"), "choice-2", "case 2"
        assert_equal returnCaseResult("J"), "other", "case 3"
    end
    
    def returnCaseResult(input)
        case input
            when "P"
                return "choice-1"
            when "IMG"
                return "choice-2"
            else
                return "other"
        end
    end
    
end
