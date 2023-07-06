a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a.select { |x| print x, + ", " if x.odd? == true }
# OR a.select { |x| print x, + ", " if x % 2 != 0 }
