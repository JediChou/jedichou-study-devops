require "test/unit"

class Test_Ch030103 < Test::Unit::TestCase

  # test arithmetic in Ruby
  def test_Arithmetic_Sample01
    assert_equal(2, 5/2)
    assert_equal(2.5, 5.0/2)
    assert_equal(2.5, 5/2.0)
  end

  # todo ZeroDivisionError

  # test arithmetic in Ruby
  def test_Arithmetic_Sample02
    assert_equal(1, 5%2)
    # todo float mod operation
    # assert_equal("Float", (1.5%0.4).class.to_s)
    # assert_equal(0.3, (1.5%0.4))
  end

  # test arithmetic in Ruby
  def test_Arithmetic_Sample03
    assert_equal(4, 2**2)
    assert_equal(0.5, 2.0**-1)
    assert_equal(0.5, 2**-1.0)
    assert_equal(3.0, 27**(1.0/3.0))
    assert_equal(1, 2**0)
    assert_equal(1, 2**(1/4))
    assert_equal(2.0, 16**(1.0/4.0))
  end

  # test arithmetic in Ruby
  def test_Arithmetic_Sample04
    assert_equal(16, 2**2**2)
    assert_equal(81, 3**2**2)
  end

  # test arithmetic in Ruby
  def test_Arithmetic_Sample05
    assert(3.0 < Float::MAX)
    assert(Float::MAX == Float::MAX)
  end

  # test arithmetic in Ruby
  def test_Arithmetic_Sample06
    assert_equal(1, 123[0])
    # TODO assert_equal(20, 123[3])
    # TODO assert_equal(3, 123[2])
  end
end