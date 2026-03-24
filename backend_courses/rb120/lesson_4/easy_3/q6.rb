class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    # self.age += 1
    @age += 1 # we can use the instance variable itself
  end
end

# In this case, `self.age=` is invoking the setter method. We can change the value of the instance variable by directly referencing it with `@`

