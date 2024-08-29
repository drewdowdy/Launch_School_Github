class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
# method lookup path for `cat1`:
# Cat >> Animal
# Ruby stops at `Animal` becasue `#color` method was found
