# Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

class Cat
  attr_accessor :name # creates getter method `#name` and setter method `#name=`

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
