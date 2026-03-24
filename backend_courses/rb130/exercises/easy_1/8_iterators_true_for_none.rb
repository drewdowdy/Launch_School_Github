=begin

Requirements:
- It should take an Array as an argument, and a block. 
- It should return true if the block returns false for all of the element values.
- Otherwise, it should return false.
- Your method should stop processing elements of the Array as soon as the block returns true.
- If the Array is empty, none? should return true, regardless of how the block is defined.
- You may, however, use either of the methods created in the previous two exercises.

=end

def all?(array)
  array.each { |e| return false if !yield(e) }
  true
end

def none?(array)
  all?(array) { |e| !yield(e) }
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# Alternate Solution

def any?(array)
  array.each { |e| return true if yield(e) }
  false
end

def none?(array)
  !any?(array) { |e| yield(e) }
end

puts ''
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
