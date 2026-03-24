=begin

=== PROBLEM ===

given a number and a set of numbers, get the sum of the multiples of all the numbers in the set that are less than the given number

Rules:
- if no set of numbers are given, use [3, 5] by default
- multiples must be less than and NOT equal to the given number
- given number must be a natural number
- multiples of n: numbers that can be evenly divided by n

=== DATA ===

input:
- integer (limit)
- set of integers (get multiples)
output:
- integer (sum of all the multiples)

=== BRAINSTORM ===

multiples must be unique

range from (1...number)

if the possible_mult is a multiple of any number from the set, keep it

=end

class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def to(limit)
    multiples = (1...limit).select do |possible_mult|
      @set.any? do |num|
        possible_mult % num == 0
      end
    end

    multiples.sum
  end

  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end
end
