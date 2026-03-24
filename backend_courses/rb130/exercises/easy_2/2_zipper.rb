=begin

=== PROBLEM ===

write a #zip method that takes two equal sized arrays and returns a new array object where each element is a subarray of the elements in the corresponding indices of the original arrays

Rules:
- Don't use Array#zip
- Original arrays should not be changed
- Input arrays always have the same num of elements

=end

def zip(array1, array2)
  result = []

  0.upto(array1.size - 1) do |idx|
    result << [array1[idx], array2[idx]]
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
