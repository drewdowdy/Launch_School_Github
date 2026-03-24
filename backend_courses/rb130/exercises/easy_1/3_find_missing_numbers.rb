def missing(arr)
  result = (arr.min...arr.max).to_a
  result -= arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

def missing_two(arr)
  result = []

  arr.each_cons(2) do |first, second|
    result += ((first + 1)..(second - 1)).to_a
  end

  result
end

p missing_two([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_two([1, 2, 3, 4]) == []
p missing_two([1, 5]) == [2, 3, 4]
p missing_two([6]) == []
