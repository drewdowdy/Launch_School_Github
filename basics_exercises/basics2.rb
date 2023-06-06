#Exercise 2; find digit in 1) thousands place 2) hundreds place 3) tens place 4) ones place

num = 4830

thousands = num / 1000
hundreds =  num % 1000 /100
tens = num % 1000 % 100 / 10
ones = num % 1000 % 100 % 10

puts "#{thousands}, #{hundreds}, #{tens}, and #{ones}"