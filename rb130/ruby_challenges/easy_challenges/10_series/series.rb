=begin

=== PROBLEM ===

Write a program that takes an string of numbers as an input and returns an array of subarrays. The subarrays are all the possible 

=end

class Series
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError unless size <= numbers.size
    result = []
    last_idx = numbers.size - (size - 1)

    numbers.each_index do |idx|
      break if idx == last_idx
      result << numbers.slice(idx, size)
    end

    result
  end
end
