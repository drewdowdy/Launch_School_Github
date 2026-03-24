# Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is instantiated.

# Define the `#initialize` method in the `Cat` class with the reserved word `def`. Within the method definition, the `#puts` method is invoked and passed the String `"I'm a cat!"`, which outputs to the console.

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new # => I'm a cat!
