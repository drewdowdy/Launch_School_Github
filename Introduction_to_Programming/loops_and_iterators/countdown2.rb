puts "What do you want to countdown from this time? "
x = gets.chomp.to_i

until x < 0
    print x
    print ", "
    x -= 1
end

puts "Done!"