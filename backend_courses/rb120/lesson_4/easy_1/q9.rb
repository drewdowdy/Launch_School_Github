# What do you need to call to create a new instance of this class?

# You need to invoke `::new` on the class and pass in 2 arguments for `color` and `material`.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

gucci = Bag.new('black', 'leather') # `gucci` is instatiated
