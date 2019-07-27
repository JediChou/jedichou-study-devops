require "test/unit"

# user define a method
def square(x)
  x*x
end

# user define a module method
def Jedi.square(x)
  x*x
end

class Test_Ch010104 < Test::Unit::TestCase

  # test method - sample01
  def test_CallMethod_sample1
    assert_equal(4, square(2), "Call user define method")
    assert_equal(16, square(4), "Call user define method")
  end

  # test method - sample02
  def test_CallMethod_sample2
    assert_equal(4, Jedi.square(2), "Call user define module method")
    assert_equal(16, Jedi.square(4), "Call user define module method")
  end
end