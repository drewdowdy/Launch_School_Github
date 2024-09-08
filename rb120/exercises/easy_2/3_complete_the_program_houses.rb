# To make objects comparable, we can use the mixin `Comparable` and define a method `#<=>` that handles less than `<`, equal to `==`, or greater than `>` comparisons.

class House
  attr_reader :price

  include Comparable # include the `Comparable` mixin

  def initialize(price)
    @price = price
  end

  def <=>(other_house) # define method `#<=>`
    @price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive  

=begin

## Further Exploration

> Is the technique we employ here to make `House` objects comparable a good one? (Hint: is there a natural way to compare Houses? Is price the only criteria you might use?)

I don't think this is the most natural way to compare two `House` objects. Houses are much more than just their prices, so maybe other aspects that can't be represented by an integer (like color or materials). Since there is already a `#price` function built into the `House` class, using that to compare two prices like `house1.price < house2.price` would make more intuitive sense for another human using the code.

> What problems might you run into, if any? Can you think of any sort of classes where including `Comparable` is a good idea?

Classes that deal with numbers more (like perhaps mortgages, loans, etc.) would be ideal for including the `Comparable` mixin.

=end
