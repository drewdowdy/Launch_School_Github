=begin

=== RULES ===

+ num passed to constructor is size limit of fixed array
+ needs a #[]= method (setter)
+ needs a #[] method (getter)
+ needs to be able to convert from FixedArray object to Array object
+ needs to be able to convert from FixedArray object to String object

=== THOUGHTS ====

- I didn't fully realize that the standard #[] getter method for Array returns nil if the index is not in bounds
- I didn't fully realize that #[]= setter method for Array can change the size of the array if the index is out of bounds (positively)

=end

class FixedArray
  def initialize(limit)
    @array = Array.new(limit) # <-- more compact
    # @array = []
    # limit.times { @array << nil }
  end

  def [](idx)
    # @array[idx] <-- returns nil if out of bounds
    @array.fetch(idx) # have to use Array#fetch (to get error, not nil)
  end

  def []=(idx, value)
    self[idx] # <-- using the FixedArray#[] method above
    @array[idx] = value
  end

  def to_a
    @array
  end

  def to_s
    @array.to_s
  end
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
