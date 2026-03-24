class Cat
  def initialize(type)
    @type = type
  end

  def to_s # define a new #to_s method
    "I am a #{@type} cat"
  end
end

# Change the #to_s output so that a string like "I am a (type) cat" is output

tabby = Cat.new('tabby')

puts tabby
