def add_three(number)
    number + 3
end

returned_value = add_three(4)
print "Regular: "
puts returned_value

def add_three2(number)
    return number + 3
end

returned_value2 = add_three2(4)
print "Explicit return: "
puts returned_value2

def add_three3(number)
    return number + 3
    number + 4
end

returned_value3 = add_three3(4)
print "Explicit return & regular: "
puts returned_value3

#Ruby ALWAYS returns the last line UNLESS there is an explicit 'return' before
#So, in 'add_three3' the last line is ignored