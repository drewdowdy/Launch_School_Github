=begin

Requirements:

- takes arrays as an argument (and a block)
- if every element makes the block evaluate as true, return true
- otherwise, return false
- stop processing as soon as the block evaluates as false
- if input array is empty, returns true (regardless of block)

=end

def all?(array)
  array.each { |e| return false if !yield(e) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
