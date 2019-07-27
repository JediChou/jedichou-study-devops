require "test/unit"

class Test_Ch010107 < Test::Unit::TestCase

  # test regexp and range
  def test_regexp_simplest
    re_1 = Regexp.new(/[Rr]uby/)
    re_2 = Regexp.new(/\d{5}/)

    # check re_1
    assert(re_1 =~ "Ruby")
    assert(re_1 =~ "ruby")
    assert(!(re_1 =~ "test data"))
    # check re_2
    assert(re_2 =~ "10101")
    assert(re_2 =~ "12345")
    assert(!(re_2 =~ "df6767"))
  end

  # test regexp and range
  def test_range_simplest
    generation1 = case 1947
                    when 1946..1963: "Baby Boomer"
                    when 1964..1976: "Generation X"
                    when 1978..2000: "Generation Y"
                    else nil
                  end
    generation2 = case 1965
                    when 1946..1963: "Baby Boomer"
                    when 1964..1976: "Generation X"
                    when 1978..2000: "Generation Y"
                    else nil
                  end
    assert_equal("Baby Boomer", generation1)
    assert_equal("Generation X", generation2)
  end
end