limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(1, 13, limit)
puts "result is #{result}"

# undefined local variable or method `limit' for main:Object (NameError)
  # add the limit as an additional argument to the `fib` method