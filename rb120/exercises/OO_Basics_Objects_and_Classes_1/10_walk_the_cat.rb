# Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.

module Walkable # create the `Walkable` module with `module`
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable # mix in the module `Walkable` with the `include` mixin
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk # => "Let's go for a walk!"