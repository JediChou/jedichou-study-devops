require "test/unit"

class Test_Ch030102 < Test::Unit::TestCase

  # check Floating-Point Literals
  def test_FloatingPointLiterals
    assert_equal("Float", 0.0.class.to_s)
    assert_equal("Float", -3.14.class.to_s)
    assert_equal("Float", 6.02e23.class.to_s)
    assert_equal("Float", 1_000_000.01.class.to_s)
  end
end