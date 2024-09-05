# The problem with this code is that in the `#increment_milage` method, the local variable `mileage` is assigned to `total`, but the instance variable `@mileage` is what we want to reassign. We could also call the setter method `#mileage=` on `self`

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    @mileage = total # update the instance variable
  end

  def print_mileage
    puts mileage
  end
end

# OR

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total # invoke #mileage= on self
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # => 5678
