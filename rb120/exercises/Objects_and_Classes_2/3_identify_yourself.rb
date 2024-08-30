class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify # define a method #identify
    self       # here, `self` refers to the the calling object
  end
end

kitty = Cat.new('Sophie')
p kitty.identify # => #<Cat:0x00000001051f1f20 @name="Sophie">
puts kitty.identify
# `#p` is the same as `#inspect` and allows us to see all associated instance variables
