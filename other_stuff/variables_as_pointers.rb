a = "hi there"
    # variable 'a' is assigned
b = a
    # variable 'b' is assigned to what 'a' is
a = "not here"
    # 'a' is changed while b remains the same

puts a
puts b

c = "woah there"
    # variable 'c' is assigned
d = c
    # variable 'd' is assigned to what 'c' is
c << ", Bob"
    # mutates the caller that both 'c' and 'd' point to
puts c
puts d