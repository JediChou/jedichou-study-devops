require "test/unit"

class Test_Ch030203 < Test::Unit::TestCase

  def test_StringOperators_Sample01
    planet = "Earth"
    assert_equal("Hello Earth", "Hello"+" "+planet)
  end

  # Do not auto change type to string
  def test_StringOperators_Sample02
    plant_number = 20
    assert_equal("Hello planet 20", "Hello planet "+plant_number.to_s)
    assert_equal("Hello planet 20", "Hello planet #{plant_number}")
  end

  def test_StringOperators_Sample03
    assert_equal("Hello World", "Hello"<<" "<<"World")
  end

  def test_StringOperators_Sample04
    assert_equal("AB", "A"<<?B)
    assert_equal("ABC", "AB"<<67)
    # TODO alphabet<<256 # Error in Ruby 1.8: codes must be >=0 and < 256
  end

  def test_StringOperators_Sample05
    assert_equal("...", "."*3)
  end

end