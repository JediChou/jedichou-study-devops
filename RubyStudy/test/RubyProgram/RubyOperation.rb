$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class Rubyoperation < Test::Unit::TestCase
  def test_operation_1
    assert_equal(2, 5/2)
    assert_equal(2.5, 5.0/2)
    assert_equal(2.5, 5/2.0)
    assert_equal(1, 5%2)
    assert_not_equal(0.3, 1.5 % 0.4)  # Rounding error
  end

  def test_plusplus
    x = 2
    assert_equal(16, x**4)
    assert_equal(1.0/2, x**-1)
    # TODO: assert_equal(1.25992104989487, x**(1/3.0))
    assert_equal(1, x**(1/4))
    assert_equal(1, x**(1/5))
    # TODO: assert_equal(1, x**(1.0/4.0))
  end
end
