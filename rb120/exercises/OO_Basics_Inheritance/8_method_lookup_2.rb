class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# cat1.color

# method lookup path for `#color` invocation on `cat1`:
# Cat >> Animal >> Object >> Kernel >> BasicObject
# Ruby returns a NoMethodError since there was no method `#color` in any class

# Note: the `Object` class includes the `Kernel` module
