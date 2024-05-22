a = "forty two"
b = "forty two"
c = a

puts a.object_id # (same number)
puts b.object_id # (same number) <--WRONG (different number)
puts c.object_id # (same number)

# objects that have the same value might not have the same object ID (be careful)
# `c` and `a` definitly point to the same object