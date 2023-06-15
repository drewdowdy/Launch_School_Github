# ex3: write a program that gets a number from the user 
# and tells them if it is between 0-50, 51-100, or over 100

def range(a)
    if a < 0
        puts "No negative numbers please :( "
    elsif a < 50
        puts "That number is less than 50! "
    elsif 50 <= a && a <= 100
        puts "That number is between 50 and 100! "
    else a > 100
        puts "That number is over 100! "
    end 
end

puts "What number are you thinking about? "
num = gets.chomp.to_i
print range(num)