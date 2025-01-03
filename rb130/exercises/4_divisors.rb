def divisors(num)
  result = []

  1.upto(num) do |divisor|
    result << divisor if num % divisor == 0
  end

  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]

# Further Exploration

def divisors_two(num)
  result = []
  
  (Math.sqrt(num).to_i).downto(1) do |divisor|
    if num % divisor == 0
      result.unshift(divisor)
      result.push(num / divisor)
    end
  end

  result
end

p divisors_two(99400891) #== [1, 9967, 9973, 99400891]
p divisors_two(999962000357) #== [1, 999979, 999983, 999962000357]