# Using the following code, add an instance method named #rename that renames kitty when invoked.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name) # define an instance method
    self.name = name # denote setter methods with `self`
  end
end

kitty = Cat.new('Sophie')
puts kitty.name # => Sophie
kitty.rename('Chloe')
puts kitty.name # => Chloe
