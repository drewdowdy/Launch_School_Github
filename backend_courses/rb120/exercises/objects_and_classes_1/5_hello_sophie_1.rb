# Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

# We can initialize an instance variable by prepending `@` to an instance variable name. In this case, the instance variable `@name` is assigned to the value of the `name` argument of the `#initialize` method. Then we interpolate the value of the instance variable into the string given to the `#puts` invocation.

class Cat
  def initialize(name)
    @name = name 
    puts "Hello, My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie') # => Hello! My name is Sophie!
