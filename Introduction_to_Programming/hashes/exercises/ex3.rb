hash = { a: 1, b: 2, c: 3 }

hash.each_key { |k| print k, " " }
puts " "
hash.each_value { |v| print v, " " }
puts " "
hash.each { |k,v| 
    print k
    print v
    puts " "
}