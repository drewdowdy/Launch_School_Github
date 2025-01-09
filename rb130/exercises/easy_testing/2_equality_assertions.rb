require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestEquality < Minitest::Test
  def setup
    @value = 'ABC'
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end
