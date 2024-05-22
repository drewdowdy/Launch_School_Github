puts "What are we counting down from? "
x = gets.chomp.to_i

for i in 1..x do
    print x - i
    print ", "
end

puts "Done!"

# will return the collection of elements as opposed to 'nil'