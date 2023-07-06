a = [ "white snow", "winter wonderland", "melting ice", "slippery sidewalk", "salted roads", "white trees" ]
a = a.map { |x| x.split } # makes a two dimentional array (an array of arrays)
a = a.flatten # makes a one dimentional array
p a