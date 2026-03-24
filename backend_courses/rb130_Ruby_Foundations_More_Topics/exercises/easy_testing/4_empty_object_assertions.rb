require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestEmptyObjects < Minitest::Test
  def setup
    @value = [1, 2, 3]
  end

  def test_empty?
    assert_empty @value, 'Value is not empty'
  end
end
