# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one 
# two is: two
# three is: three

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "~~~"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one 
# two is: two
# three is: three

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "~~~"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: two 
# two is: three
# three is: one

# A) No new objects were assigned in the method so the variables maintain their original values.
# B) The scope of the method is closed so the original values of the variables are printed.
# C) The `gsub!` method mutates the original object so it prints different values after the method is run.
