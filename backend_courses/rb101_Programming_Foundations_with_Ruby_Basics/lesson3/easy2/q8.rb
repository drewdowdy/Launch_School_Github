advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!("Few things in life are as important as ")
advice.slice!(0...39)
advice.slice!(0, 39)

# advice.slice("Few things in life are as important as ") 
  # String#slice (no bang [!]) will return the argument from the string without mutating the original string.

p advice