a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a << 11
a.unshift(0)
a.pop
a << 3
a.uniq!
    # '.uniq' deletes duplicates w/out modifying the caller
    # '.uniq!' eletes duplicates by modifying the caller
p a