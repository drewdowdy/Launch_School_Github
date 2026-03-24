def step(start, stop, step)
  counter = start
  
  loop do
    yield(counter)
    break if (counter + step) > stop
    counter += step
  end

  p counter
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
# => 10

step(1, 10, 8) { |value| puts "value = #{value}" }
# value = 1
# value = 9
# => 9

step(5, 15, 3) { |value| puts "value = #{value}" }
# value = 5
# value = 8
# value = 11
# value = 14
# => 14