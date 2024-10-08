# Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.

puts "Hello"
puts 5
puts [1, 2, 3]

# Exptected outputs:
# String
# Integer
# Array

puts "Hello".class   # => String
puts 5.class         # => Integer
puts [1, 2, 3].class # => Array

# invoke the #class method
