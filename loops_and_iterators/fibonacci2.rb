def fibonacci(number)
    if number == 0
        puts "That is not a good ordinal number :( "
    elsif number == 1
        0
    elsif number == 2 || number == 3
        1
    else
        fibonacci(number - 1) + fibonacci(number - 2)
    end
end

puts "What number do you want to evaluate? "
num = gets.chomp.to_i
print fibonacci(num)
print " is the #{num}th number in the Fibonacci Sequence."