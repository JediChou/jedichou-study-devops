require "test/unit"

class Test_Ch030204 < Test::Unit::TestCase

  def test_AccessingCharactersAndSubStrings_Sample01
    s = 'hello'
    assert_equal(104, s[0])
    assert_equal(111, s[s.length-1])
    assert_equal(111, s[-1])
    assert_equal(108, s[-2])
    assert_equal(104, s[-s.length])
    assert_equal(nil, s[s.length])
  end

  def test_AccessingCharactersAndSubStrings_Sample02
    s1 = 'hello' ;  s1[0] = ?H ; assert_equal('Hello', s1)
    s2 = 'hello' ;  s2[-1] = ?O ; assert_equal('hellO', s2)
    # todo s3 = 'hello' ;  s3[s3.length] = ?! ; assert_equal('hellO!', s3)
  end

  def test_AccessingCharacterAndSubStrings_Sample03
    s = 'hello'
    assert_equal('he', s[0, 2])
    assert_equal('o', s[-1, 1])
    assert_equal("", s[0, 0])
  end

end