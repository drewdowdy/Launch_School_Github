def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    current_element = array[counter]
    accumulator = yield(accumulator, current_element)
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
