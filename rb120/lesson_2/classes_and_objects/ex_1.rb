class Person
  def initialize(name)
    @name = name
  end

  def name # getter method
    @name
  end

  def name=(name) # setter method
    @name = name
  end
end

# OR

class Person
  attr_accessor :name # attribute accessor (both getter and setter)
  
  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'
