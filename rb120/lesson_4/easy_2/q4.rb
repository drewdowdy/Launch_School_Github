# To simplify this class, we can add a `attr_accessor` for `:type`, replacing the getter and setter methods `#type` and `#type=`.

# We can also replace `@type` with `type` in the invocation of `#describe_type`. Removing the `@` means that the return value of `#type` is used instead of the instance variable `@type` directly. It is considered cleaner and standard practice.

class BeesWax
  attr_accessor :type # replaces `#type` and `#type=`

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
    # puts "I am a #{@type} of Bees Wax"
    puts "I am a #{type} of Bees Wax" # use `#type`, not `@type`
  end
end

white = BeesWax.new('white')
white.describe_type # => I am a white of Bees Wax
