# What's the default return value of `#to_s` invoked on an object?

# The `#to_s` method invoked on an object returns the calss and an encoding of the object ID together.

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)

puts sparky     # => #<GoodDog:0x0000000104af1cc0>
