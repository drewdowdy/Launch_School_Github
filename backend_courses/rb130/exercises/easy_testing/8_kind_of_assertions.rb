require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Parent
end

class Child < Parent
end

class TestKindOf < Minitest::Test
  def setup
    @child = Child.new
  end

  def test_kind_of
    assert_kind_of(Parent, @child)
    # checks if object is either an instance of the given class or any of the classes subclasses
  end
end
