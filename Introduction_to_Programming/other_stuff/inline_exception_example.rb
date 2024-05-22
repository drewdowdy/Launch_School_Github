zero = 0
puts "Before 'each' call"
zero.each { |element| puts element } rescue
puts "Can't do that!"
puts "After 'each' call"
# the 'zero.each' produces an error since we can't call each on integer 0
# the 'rescue' allows us to continue to execute outside the call on the next line