class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

civic = Car.new('Honda', 'Civic')
ninja = Motorcycle.new('Kawasaki', 'Ninja')
f150 = Truck.new('Ford', 'F150 Raptor', '2000lbs')

puts civic, ninja, f150
# => Honda Civic
# => Kawasaki Ninja
# => Ford F150 Raptor
puts civic.wheels, ninja.wheels, f150.wheels
# => 4
# => 2
# => 6
puts civic.make, ninja.make, f150.make
# => Honda
# => Kawasaki
# => Ford
puts f150.payload
# => 2000lbs

=begin

## Further Exploration

> Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not?

I think it makes sense to define a `#wheels` method in the `Vehicle` class since most vehicles would have wheels. If any new vehicle subclass is created (like `Boat`) then it could have a special `#wheels` method to override the one in `Vehicle`. 

> If you think it does make sense, what method body would you write?

=end

# ### Solution 1

# We can initialize `@wheel_num` in the `Vehicle` class and use `#initialize` in each subclass to initialize the correct number.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model, wheel_num)
    @make = make
    @model = model
    @wheel_num = wheel_num # initialize @wheel_num
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    @wheel_num
  end
end

class Car < Vehicle
  def initialize(make, model)
    super(make, model, 4) # pass `make`, `model`, and the correct number to the superclass
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super(make, model, 2) # pass `make`, `model`, and the correct number to the superclass
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, 6) # pass `make`, `model`, and the correct number to the superclass
    @payload = payload
  end
end

# OR we can use `self.class::CONSTANT` to call a constant of a class.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEEL_NUM # call the constant
  end
end

class Car < Vehicle
  WHEEL_NUM = 4 # initialize the right number
end

class Motorcycle < Vehicle
  WHEEL_NUM = 2 # initialize the right number
end

class Truck < Vehicle
  attr_reader :payload
  
  WHEEL_NUM = 6 # initialize the right number

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

civic = Car.new('Honda', 'Civic')
ninja = Motorcycle.new('Kawasaki', 'Ninja')
f150 = Truck.new('Ford', 'F150 Raptor', '2000lbs')

puts civic.wheels, ninja.wheels, f150.wheels
# => 4
# => 2
# => 6