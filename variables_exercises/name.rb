#Exercise 1: ask the user to type in name and print greeting
#Exercise 3: print user name 10 times
#Exercise 4: get user first & last name and display together

puts "What's your first name? "
firstname = gets.chomp
puts "What's your last name? "
lastname = gets.chomp
puts "Your full name is #{firstname} #{lastname}!"
10.times { puts firstname + " " + lastname }
#used curly brakets becuase it is one line of code

#10.times do
#   puts name
#end