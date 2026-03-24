require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestNil < Minitest::Test
  def setup
    @value = true
  end

  def test_nil
    assert_nil @value, "Value is not nil"
  end
end
