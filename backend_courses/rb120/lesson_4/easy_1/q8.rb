# In this case, what does `self` refer to?

# Here, `self` refers to the name of the class. It is used to name the class method `::cats_count`

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
