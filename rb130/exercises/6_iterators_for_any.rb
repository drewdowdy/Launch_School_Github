def any?(array)
  index = 0

  while index < array.size
    return true if yield(array[index])
    index += 1
  end

  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# Further Exploration

=begin

My solution only works with indexed collections (like Arrays)

=end

# Enumerable#find - returns the first element that makes the block evaluate as true
# !! - double bang turns the value into a boolean

def second_any?(collection)
  !!collection.find { |element| yield(element) }
end

p second_any?([1, 3, 5, 6]) { |value| value.even? } == true
p second_any?([2, 4, 6, 8]) { |value| value.odd? } == false
p second_any?({a:0, b:1, c:2}) { |k, v| v.even? } == true
p second_any?({a:0, b:1, c:2}) { |k, v| v > 3 } == false
