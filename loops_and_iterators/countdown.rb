puts "What are we counting down from? "
x = gets.chomp.to_i

while x >= 0
    print x
    print ", "
    x = x - 1
end
puts "Done!"