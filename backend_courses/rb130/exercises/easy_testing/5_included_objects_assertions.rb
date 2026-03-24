require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestIncludedObjects < Minitest::Test
  def setup
    @array = [1, 2, 3]
  end

  def test_include?
    assert_includes(@array, 5, '5 is not included')
  end
end
