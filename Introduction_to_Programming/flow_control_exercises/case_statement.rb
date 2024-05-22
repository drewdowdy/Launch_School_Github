puts "What number is a? "
a = gets.chomp.to_i

case a
when 5
    puts "a is 5"
when 6
    puts "a is 6"
else
    puts "a is neither 5 nor 6"
end

# refactored (different code, same function)

puts "What number is b?"
b = gets.chomp.to_i

answer = case b
when 5
    "b is 5"
when 6
    "b is 6"
else
    "b is neither 5 nor 6"
end

puts answer