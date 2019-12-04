require "test/unit"

# a simplest test help method
def Jedi.mulReturn()
  ["Hello", "World"]
end

# Test ruby assignment with ruby-1.8.7-p370
class Test_Ch010105 < Test::Unit::TestCase

  # assignment test sample 01
  def test_assignment_sample01
    x = 1; assert_equal(1, x, "simplest assignment")
  end

  # assignment test sample 02 - increment, decrement
  def test_assignment_sample02
    x = 0; y = 0
    x += 1; y -= 1
    assert_equal(1, x, "increment x: note Ruby does not have ++")
    assert_equal(-1, y, "decrement y: no -- operator, either")
  end

  # assignment test sample 03
  def test_assignment_sample03
    x, y = 1, 2
    a, b = "CharA", "CharB"; a, b = b, a
    c, d, e = [1, 2, 3]
    assert_equal(1, x)
    assert_equal(2, y)
    assert_equal("CharB", a)
    assert_equal("CharA", b)
    assert_equal(1, c)
    assert_equal(2, d)
    assert_equal(3, e)
  end

  # assignment test sample 04 - multiple return
  def test_assignment_sample04
    str_first, str_second = Jedi.mulReturn()
    assert_equal("Hello", str_first)
    assert_equal("World", str_second)
  end
end