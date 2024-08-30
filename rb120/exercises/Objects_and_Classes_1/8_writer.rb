# Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name) # manually define setter method
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

# OR

class Cat
  attr_reader :name 
  attr_writer :name # creates setter method `#name=`

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!" # uses the value of self.name
  end
end

kitty = Cat.new('Sophie')
kitty.greet # => Hello! My name is Sophie!
kitty.name = 'Luna'
kitty.greet # => Hello! My name is Luna!
