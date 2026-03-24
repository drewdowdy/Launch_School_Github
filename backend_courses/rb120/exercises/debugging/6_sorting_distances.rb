class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  # def ==(other) <- removed; covered in `#<=>`
  #   case unit
  #   when :km  then value == other.as_kilometers.value
  #   when :mi  then value == other.as_miles.value
  #   when :nmi then value == other.as_nautical_miles.value
  #   end
  # end

  # def <(other) <- removed; covered in `#<=>`
  #   case unit
  #   when :km  then value < other.as_kilometers.value
  #   when :mi  then value < other.as_miles.value
  #   when :nmi then value < other.as_nautical_miles.value
  #   end
  # end

  def <=(other)
    self < other || self == other
  end

  # def >(other) <- removed; covered in `#<=>`
  #   !(self <= other)
  # end

  def >=(other)
    self > other || self == other
  end

  # define a new `#<=>` method to be used by the `#sort` invocation
  # def <=>(other)
  #   return -1 if
  #     case unit
  #     when :km  then value < other.as_kilometers.value
  #     when :mi  then value < other.as_miles.value
  #     when :nmi then value < other.as_nautical_miles.value
  #     end 

  #   return 0 if 
  #     case unit
  #     when :km  then value == other.as_kilometers.value
  #     when :mi  then value == other.as_miles.value
  #     when :nmi then value == other.as_nautical_miles.value
  #     end 

  #   return 1 if
  #     case unit
  #     when :km  then value > other.as_kilometers.value
  #     when :mi  then value > other.as_miles.value
  #     when :nmi then value > other.as_nautical_miles.value
  #     end 
  # end 

  # easier version
  def <=>(other)
    case unit
    when :km  then value <=> other.as_kilometers.value
    when :mi  then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end 
  end 

  def to_s
    "#{value} #{unit}"
  end

  private

  # change `private` to `protected`
  # protected

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

=begin

Error: `ArgumentErorr`, we need to convert the units for every comparison method. We can't call `self` and compare to `other` directly

Fix: Since the `#sort` invocation uses the `#<=>` method to sort, we can define our own `#<=>` method

Further Exploration:

When using floating point numbers, there's always a bit of imprecision. 

We can account for this by instead of comparing for equality with `==`, we can check the difference with a margin of error.

=end

Length.new(10, :km).as_nautical_miles.as_kilometers == Length.new(10, :km) # => false

(Length.new(10, :km).as_nautical_miles.as_kilometers - Length.new(10, :km)).abs < 0.001 # => true
