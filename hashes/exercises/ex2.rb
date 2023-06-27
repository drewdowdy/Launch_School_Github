# Illistrate the differences between the 'merge' & 'merge!' methods

h1 = { a: 1, b: 2, c: 3 }
h2 = { d: 4, e: 5, f: 6 }

print "This is hash 'h1': "
p h1
print "This is hash 'h2': "
p h2
puts "----------"
print "Using 'merge' gives: "
puts h1.merge(h2)
puts "Remaining hashes after 'merge': "
puts h1
puts h2
puts "----------"
print "Using 'merge!' gives: "
puts h1.merge!(h2)
puts "Remaining hashes after 'merge': "
puts h1
puts h2