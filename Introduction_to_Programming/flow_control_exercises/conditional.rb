puts "Type in a number:"
a = gets.chomp.to_i

if a == 3
    puts "That is 3!"
elsif a == 4
    puts "That is 4!"
else
    puts "That is neither 3, nor 4.."
end

# 'gets' = gets input from user
# 'chomp' = gets rid of new line when user inputs data
# to_i = converts to integer

# 'if' conditinals can come second if it's one line
    # ex) puts "x is 3" if x == 3