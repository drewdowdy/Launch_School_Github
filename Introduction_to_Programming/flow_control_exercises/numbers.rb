(32*4) >= "129"
# => false <-WRONG
# ERROR = comparison of Integer with String failed (ArgumentError)
847 == "847"
# => false
"847" < "846"
# => false
"847" > "846"
# => true
"847" > "8478"
# => false
"847" < "8478"
# => true

# when comparing strings, Ruby checks one by one left to right
# when it finds a differing character it THEN makes a decision