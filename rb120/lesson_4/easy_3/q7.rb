class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

=begin

What part is unecessary in the `Light` class?

Answer:

- `return` keyword: the last line of a method definition is implicitly returned
- `attr_accessor`: no parts of the class are using getter or setter methods for `brightness` or `color`

=end
