# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting # create a class method by appending `self` to method name
    puts "Hello. I'm a cat!"
  end
end

Cat.generic_greeting # class methods can be invoked on the class itself

# In this case, `::generic_greeting` is a class method.

kitty = Cat.new
kitty.generic_greeting       # => NoMethodError
kitty.class.generic_greeting # => Hello. I'm a cat!

## Further Exploration

# In this case `kitty.class.generic_greeting` is the same as `Cat.generic_greeting` because the #class method invoked on an object returns it's class, which can be used to invoke `::generic_greeting`.
