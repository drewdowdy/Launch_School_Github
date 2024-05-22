def equal_to_four(x)
    if x == 4
        puts "yup"
    else
        puts "nope"
    end
end

puts "What number is equal to '4'? "
num = gets.chomp
equal_to_four(num)

# error.rb:6: syntax error, unexpected end-of-input
# Need to end the 'if' statement AND the method