# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

# We can manually define a method `#name` that returns the value of the instance variable `@name`.

class Cat
  def initialize(name)
    @name = name
  end

  def name # getter method manually definied
    @name
  end

  def greet
    puts "Hello! My name is #{name}!"# uses the return value of #name
  end
end

# We can also use the `attr_reader` method to create a getter method with the same name as the symbol passed to it (in this case `name`).

class Cat
  attr_reader :name # creates getter method called #name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!" # uses the return value of #name
  end
end

kitty = Cat.new('Sophie')
kitty.greet
