flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p (flintstones.select{|k,v| k == "Barney"}).flatten
  # `Hash#select{|key,value|...}` returns a new Hash object whose entries are those for which the block returns a truthy value
  # `Hash#flatten` returns a new Array object that is a 1-dimensional flattening of self

p flintstones.assoc("Barney") 
  # `Hash#assoc` if the given key is found, returns a 2-element Array containing that key and its value
