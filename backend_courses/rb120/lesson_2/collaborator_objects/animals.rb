# In Ruby, subclasses can only inherit from one superclass (parent class). 

class Pet; end

class Fish < Pet
  def swim # same as #swim in Dog
    puts "swimming!"
  end
end

class Mammals < Pet
  def run
    puts "running!"
  end

  def jump
    puts "jumping!"
  end
end

class Cat < Mammals
  def speak
    puts "meow!"
  end
end

class Dog < Mammals
  def speak
    puts "woof!"
  end

  def fetch
    puts "fetching!"
  end

  def swim # same as #swim in Fish
    puts "swimming!"
  end
end

class Bulldog < Dog
  def swim # overrides swim inherited from `Dog`
    puts "can't swim!"
  end
end

# We can reduce the redunancy of the code by creating a module and mix in the methods with #include

# Refactored:

module Swimmable
  def swim
    puts "swimming!"
  end
end

class Pet; end

class Fish < Pet
  include Swimmable # mix in the `Swimmable` module
end

class Mammals < Pet
  def run
    puts "running!"
  end

  def jump
    puts "jumping!"
  end
end

class Cat < Mammals
  def speak
    puts "meow!"
  end
end

class Dog < Mammals
  include Swimmable # mix in the `Swimmable` module

  def speak
    puts "woof!"
  end

  def fetch
    puts "fetching!"
  end
end

class Bulldog < Dog
  def swim # overrides #swim from `Swimmable`
    puts "can't swim!"
  end
end

dog = Dog.new
cat = Cat.new
fish = Fish.new
bulldog = Bulldog.new

dog.swim     # => swimming!
cat.swim     # => NoMethodError
fish.swim    # => swimming!
bulldog.swim # => cant' swim!
