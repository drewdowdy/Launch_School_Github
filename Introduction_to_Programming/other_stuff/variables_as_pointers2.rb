a = [ 1, 2, 3, 4 ]
b = a
c = a.uniq
    # '.uniq' returns a new array w/ duplications removed
        # if there are no duplications to remove, returns nil
    # i think, '.uniq!' will destroy original array and return one with no duplications
p a
p b
p c

def test(x)
    x.map! { |letter| "I like letter: #{letter}" }
end
d = [ "a", "b", "c" ]
p test(d)