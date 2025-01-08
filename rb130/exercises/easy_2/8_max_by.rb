def max_by(array)
  return nil if array.empty?
  
  max = array.shift
  max_value = yield(max)

  array.each do |element|
    current_value = yield(element)
    if current_value > max_value
      max = element
      max_value = current_value
    end
  end

  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
