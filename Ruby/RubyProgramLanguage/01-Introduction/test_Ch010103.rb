require "test/unit"

class Test_Ch010103 < Test::Unit::TestCase

  # From page 4
  def test_ExpressionsAndOperatorInRuby_sample1
    x = if(1>2) then x=100 else x=200 end
    y = if(2>1) then y=100 else y=200 end
    assert_equal(200, x)
    assert_equal(100, y)
  end

  # From page 5
  def test_ExpressionsAndOperatorInRuby_sample2
    assert_equal(3, 1+2, "=>3: addition")
    assert_equal(2, 1*2, "=>2: multiplication")
    assert(1+2==3, "true: == tests equality")
    assert_equal(8, 2**3, "2 to the power 3: Ruby has arbitrary size ints")
    assert_equal("Ruby rocks!", "Ruby"+" rocks!", "string concatenation")
    assert_equal("Ruby!Ruby!", "Ruby!"*2, "string repetition")
    assert_equal("3 rubies", "%d %s" % [3, "rubies"], "Python-style, printf formatting")
    assert_equal(100, 100>99?100:99, "The conditional operator")
  end
end