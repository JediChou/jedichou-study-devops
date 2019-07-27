require 'test/unit'

class TC_equaleSign < Test::Unit::TestCase
    
    def test_firstequal
        assert ((1..3) === 2)
        assert String === "xyzzy"
        # assert_equal (/zz/ === "zyzzy"), 2, "Get error"
    end
    
end