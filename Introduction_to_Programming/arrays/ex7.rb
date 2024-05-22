myarray = ["billy", 1, 3.14, "pie"]
myarray.each_with_index{ |val, inx| puts "At index #{inx}, there is #{val}" }