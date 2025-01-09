require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestType < Minitest::Test
  def setup
    @value = 'hello'
  end

  def test_type
    assert_instance_of(Numeric, @value, "Value is not a Numeric object")
    # checks if object is an instance of ONLY that class
  end
end
