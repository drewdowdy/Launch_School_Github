advice = "Few things in life are as important as house training your pet dinosaur."

# advice = advice.split
# advice[6] = 'urgent'
# advice = advice.join(' ')

advice.gsub!('important', 'urgent') # replaces substring and returns self with replacement

p advice