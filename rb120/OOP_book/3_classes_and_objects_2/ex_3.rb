class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# test.rb:9:in `<main>': undefined method `name=' for
#<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# We need to change `attr_reader` to `attr_accessor` in order to make getter and setter methods for `:name`

class Person
  attr_accessor :name # now it has getter and setter methods

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
