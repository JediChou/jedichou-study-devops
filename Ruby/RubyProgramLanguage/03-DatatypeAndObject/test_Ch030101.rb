require "test/unit"

class Test_Ch030101 < Test::Unit::TestCase

  # test Integer Literals
  def test_IntegerLiterals_sample01
    assert_equal("Fixnum", 0.class.to_s)
    assert_equal("Fixnum", 123.class.to_s)
    assert_equal("Bignum", 12345678901234567890.class.to_s)
  end

  # test Integer Literals - thousands separator
  def test_IntegerLiterals_sample02
    assert_equal("Fixnum", 1_000_000_000.class.to_s)
  end

  # test Integer Literals
  def test_IntegerLiterals_sample03
    assert_equal("Fixnum", 0377.class.to_s)
    assert_equal("Fixnum", 0b1111_1111.class.to_s)
    assert_equal("Fixnum", 0xFF.class.to_s)
  end
end