puts "the value of 40 + 2 is " + (40 + 2)
  # error: no implicit conversion of Integer into String (TypeError)

puts "the value of 40 + 2 is " + (40 + 2).to_s # convert to string
# OR
puts "the value of 40 + 2 is #{40 + 2}" # string interpolation
