require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestRefutations < Minitest::Test
  def setup
    @array = ['abc', 'def', 'ghi']
  end

  def test_refute
    refute_includes(@array, 'xyz')
  end
end
