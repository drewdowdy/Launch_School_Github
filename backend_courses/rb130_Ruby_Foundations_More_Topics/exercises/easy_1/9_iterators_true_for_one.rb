def all?(array)
  array.each { |e| return false if !yield(e) }
  true
end

def any?(array)
  array.each { |e| return true if yield(e) }
  false
end

def none?(array)
  !any?(array) { |e| yield(e) }
end

def one?(array)
  array.count { |e| yield(e) } == 1
end

def one?(array)
  count = 0

  array.each do |e|
    count += 1 if yield(e)
    return false if count > 1
  end

  count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
