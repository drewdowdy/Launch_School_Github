# Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

# We can define the `#greet` method with the reserved word `def` and move the `#puts` invocation and it's passed String inside the method definition. The instance varaible `@name` is available throughout the `Cat` class so the `#greet` method is able to access it.
 
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet # => Hello! My name is Sophie!

kitty2 = 'Socks'
kitty2.greet # => 6_hello_sophie_2.rb:17:in `<main>': undefined method `greet' for "Horchata":String (NoMethodError)

# This throws an error since `kitty2` is not an instance of the `Cat` class where the `#greet` method is available.
