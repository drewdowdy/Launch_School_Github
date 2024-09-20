# What is the `@@cats_count` variable? What code can you write to prove it?

## `@@cats_count` is a class variable that is accessible to all instances of the `Cat` class. In this case, it is the integer `0` but increases by `1` with every instantiation of the `Cat` class.

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

oreo = Cat.new('black')
p Cat.cats_count # => 1

tiger = Cat.new('orange')
p Cat.cats_count # => 2
