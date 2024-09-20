# In this case, what does `self` refer to?

# Here, `self` referes to the object that is invoking the `#make_one_year_older` instance method.

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
