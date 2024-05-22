def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-1)
p factors(0)
p factors(1)
p factors(423_842)

# BONUS 1
  # The `number % divisor == 0` is to make sure that when a number is divided there is no remainder

# BONUS 2
  # Putting `factors` at the end returns the result of our method. W/out it, we would not get our results after the method completes.