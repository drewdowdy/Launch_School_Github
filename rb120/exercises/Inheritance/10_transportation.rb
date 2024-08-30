# Modules can be used for namespacing. Namespacing is when similar classes are grouped togehter within a module.

module Transportation
  class Vehicle
  end

  class Car < Vehicle
  end

  class Truck < Vehicle
  end
end

# We can instantiate a class in a module with `::` after the module name:

Transportation::Car.new
Transportation::Truck.new
