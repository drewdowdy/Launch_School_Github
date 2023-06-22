arr = ["b", "a"]
    # => ["b", "a"]
arr = arr.product(Array(1..3))
    # => [["b",1],["b",2],["b",3],["a",1],["a",2],["a",3]]
arr.first.delete(arr.first.last)
    # => 1
    # arr = [["b"],["b",2],["b",3],["a",1],["a",2],["a",3]]

arr = ["b", "a"]
    # => ["b", "a"]
arr = arr.product([Array(1..3)])
    # => [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
    # wrapping 'Array(1..3)' in [] gives us [[1,2,3]]
    # it's an array with 1 element 
    # which itself is an array with 3 elements
arr.first.delete(arr.first.last)
    # => [1, 2, 3]
    # arr = [["b"], ["a", [1, 2, 3]]