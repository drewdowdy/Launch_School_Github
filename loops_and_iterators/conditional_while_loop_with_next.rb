x = 0

while x <= 10
    if x == 3
        x += 1
        next
    elsif x.odd?
        puts x
    end
    x += 1
end

# if 'x' is 3, then add 1 and skip