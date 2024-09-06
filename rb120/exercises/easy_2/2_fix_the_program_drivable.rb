module Drivable
  def drive # remove `self.` from the definition
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# Methods prefixed by `self` are only accessible within the class or module it was defined in.
