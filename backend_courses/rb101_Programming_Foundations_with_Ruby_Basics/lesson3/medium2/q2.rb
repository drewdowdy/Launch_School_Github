a = 42
b = 42
c = a

puts a.object_id # => (same number)
puts b.object_id # => (same number)
puts c.object_id # => (same number)

# Perhaps, integers always have the same object ID so all variables point to the same object
# Integers are immutable so each integer has it's own ID
