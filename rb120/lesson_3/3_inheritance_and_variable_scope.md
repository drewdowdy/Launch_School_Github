# Inheritance and Variable Scope

## Instance Variables

A subclass can access an instance variable from its superclass.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"    # @name can be referenced here
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name   # => bark! bark! Teddy bark! bark!
```

HOWEVER, the instance variable **must be initialized** first.

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim            # => nil
teddy.enable_swimming # this initializes @can_swim
teddy.swim            # => swimming!
```

## Class Variables

A subclass can also access class varaibles from its superclass. But, because there's only one copy, it a subclass reassigns it, it changes the value across all subclasses and the superclass.

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2 # this reassigns the value of `@@wheels` to 2
end

class Car < Vehicle
end

Motorcycle.wheels   # => 2
Vehicle.wheels      # => 2  Unexpected...
Car.wheels          # => 2  Unexpected...
```

**AVOID** using class variables with inheritance!!

## Constants

If a constant value is not in the lexical scope of its reference, Ruby will search up the inheritance hierarchy of the class/module that referenced it. If it's not found a `NameError` is raised.

```ruby
module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels         # => 4
puts car.maintenance    # => NameError: uninitialized constant Vehicle::WHEELS
```
