# First, we need to allow objects to be instantiated with letters and let `@letters` reference the input. Then, define a `#uppercase` instance method that can be used outside the class. Finally,  define a `::lowercase` class method that can be invoked on the class `Transform`.

class Transform
  def initialize(letters)
    @letters = letters
  end

  def uppercase
    @letters.upcase
  end

  def self.lowercase(letters)
    letters.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase          # => ABC
puts Transform.lowercase('XYZ') # => xyz

# class methods may also be called "singleton methods"
