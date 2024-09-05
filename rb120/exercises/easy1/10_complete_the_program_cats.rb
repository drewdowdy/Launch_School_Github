class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color) # create an #initialize method for `Cat` class
    super(name, age)               # pass `name` and `age` to the parent class to be initialized
    @color = color                 # initialize `@color` to `color`
  end

  def to_s                         # define a `#to_s` method to create desired output of a `#puts` invocation
    "My cat #{@name} is #{@age} and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# => My cat Pudding is 7 years old and has black and white fur.
# => My cat Butterscotch is 10 years old and has tan and white fur.

=begin

## Further Exploration

> Why would we be able to omit the initialize method? 

Since the `Cat` class already inherits an `#initialize` method from the `Pets` class, we can modify the `#initialize` method of the `Pet` class and the `Cat` class would be able to use it.

> Would it be a good idea to modify Pet in this way? Why or why not?

In some cases it could make sense to modify the superclass `#initialize` method if all the subclasses will be using the method in the same way and would reduce redundancy in the code. But, if we only want to consider color in the `Cat` class, then creating it's own `#instance` method would make more sense.

> How might you deal with some of the problems, if any, that might arise from modifying Pet?

If we have many subclasses that inherit from `Pet` but don't require color, then we can set a default value for color that can be changed by subclasses that would use the `@color` instance variable.

=end

class Pet
  def initialize(name, age, color = '') # assign a default value for color to make it optional
    @name = name
    @age = age
    @color = color
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} and has #{@color} fur."
  end
end

class Lizard < Pet
  def to_s
    "My lizard #{@name} is #{@age} years old."
  end
end

steve = Lizard.new('Steve', 2) # the `Lizard` class doesn't need to put any value for `@color`, so it instead reference `''`.
mittens = Cat.new('Mittens', 3, 'black and white')

puts steve   # => My lizard Steve is 2 years old.
puts mittens # => My cat Mittens is 3 and has black and white fur.
