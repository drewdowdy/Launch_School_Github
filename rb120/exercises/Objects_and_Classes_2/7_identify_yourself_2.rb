# Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s # override the default `#to_s` method
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty # => I'm Sophie!
