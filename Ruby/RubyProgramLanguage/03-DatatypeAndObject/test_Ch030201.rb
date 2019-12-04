require "test/unit"

class Test_Ch030201 < Test::Unit::TestCase

  def test_unicode_ruby19
    # Todo assert_equal("x", "\u00D7")
  end

  def test_NewString
    assert_equal("", String.new)
    assert_equal("", String.new())
    assert_equal("abc", String.new("abc"))
  end
end