class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    @height = side # initialize `@height` as `side`
    @width = side  # also initialize `@width` as `side`
  end
end

# OR

class Square < Rectangle
  def initialize(side)
    @height = @width = side # single line multiple assignment (the last part is what all the other parts before will reference)
  end
end

# OR

class Square < Rectangle
  def initialize(side)
    super(side, side) # invoke keyword `super` to pass `side` twice as `height` and `width` to the parent class
  end
end

# OR

class Square < Rectangle
  def initialize(height, width = height) # set the optional argument `width` to the same value as `height`
    super # invoke keyword `super`, passing all arguments (the input `height` and the default value `width`) to the parent class
  end
end

square = Square.new(5)
puts "area of square = #{square.area}" # => area of square = 25
