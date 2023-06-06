#Exercise 1: ask the user to type in name and print greeting
#Exercise 3: print user name 10 times

puts "What's your name? "
name = gets.chomp
puts "Greetings #{name}! You're using Ruby :)"
10.times { puts name }
#used curly brakets becuase it is one line of code

#10.times do
#   puts name
#end