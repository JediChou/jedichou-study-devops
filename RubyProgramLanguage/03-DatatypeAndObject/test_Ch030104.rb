require "test/unit"

class Test_Ch030104 < Test::Unit::TestCase

  def test_BinaryFloatingPointAndRoundingErrors
    assert_not_equal(0.1, (0.4-0.3), "Evaluates to false in most implementations")
  end
end