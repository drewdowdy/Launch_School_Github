require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def initialize
    @list = [1, 2, 3]
  end

  def process
    self
  end
end

class TestSameObjects < Minitest::Test
  def setup
    @list = List.new
  end

  def test_same_object
    assert_same(@list, @list.process)
    # uses #equal? to determine if objects are the same object
  end
end
