#Exercise 1; Add two strings together

first_name = "John"
last_name = "Doe"

puts first_name + " " + last_name
puts "#{first_name} #{last_name}"

#Exercise 2; find digit in 1) thousands place 2) hundreds place 3) tens place 4) ones place

num = 4830

thousands = num / 1000
hundreds =  num % 1000 /100
tens = num % 1000 % 100 / 10
ones = num % 1000 % 100 % 10

puts "#{thousands}, #{hundreds}, #{tens}, and #{ones}"

#Exercise 3; use a hash to store a list of movie titles with the year they came out

movies = {
    "Toy Story 2" => 1999,
    "Inception" => 2010,
    "Interstellar" => 2014,
    "Spirited Away" => 2001,
    "Parasite" => 2019
}

movies.each do |movie, year|
    puts "hash #{year}"
end

#Exercise 4; use the dates from Ex3 and put them in an array and display them

dates = [1999, 2010, 2014, 2001, 2019]

dates.each do |x|
    puts "array #{x}"
end

#Exercise 5; output the factorial of the numbers 5, 6, 7, and 8

print "5! is "
puts 5 * 4 * 3 * 2 * 1
print "6! is "
puts 6 * 5 * 4 * 3 * 2 * 1
print "7! is "
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
print "8! is "
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

#Exercise 6; write a program that calculates the squares of 3 float numbers and outputs results

num1 = 5
num2 = 6
num3 = 7

print "#{num1} squared is "
puts num1 * num1
print "#{num2} squared is "
puts num2 * num2
print "#{num3} squared is "