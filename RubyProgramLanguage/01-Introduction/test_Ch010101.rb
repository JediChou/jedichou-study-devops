require "test/unit"

class Test_Ch010101 < Test::Unit::TestCase
  def test_RubyIsObjectOriented
    assert_equal("Fixnum", 1.class.to_s, "Integer class check.")
    assert_equal("Float", 0.0.class.to_s, "Float class check.")
    assert_equal("TrueClass", true.class.to_s, "Logic class check")
    assert_equal("FalseClass", false.class.to_s, "Logic class check")
    assert_equal("NilClass", nil.class.to_s, "Nil class check")
  end

  def test_BasicType
    assert_equal("Array", [].class.to_s, "Get array class name")
    assert_equal("Hash", {}.class.to_s, "Get hash class name")
  end
end