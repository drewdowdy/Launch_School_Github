arr = [15, 7, 18, 5, 12, 8, 5, 1]

puts arr.index(5)
    # => 5 <-WRONG
    # => 3 
        # it's the first index of the argument
puts arr.index[5]
    # => 5 <-WRONG
    # => error: in `<main>': undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index> (NoMethodError)
    # 
puts arr[5]
    # => 8