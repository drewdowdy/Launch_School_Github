# To simplify this class, we can add a `attr_accessor` for `:type`, replacing the getter and setter methods `#type` and `#type=`.

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

white = BeesWax.new('white')
white.describe_type # => I am a white of Bees Wax
