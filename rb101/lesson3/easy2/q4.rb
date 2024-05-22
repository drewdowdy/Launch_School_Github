advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("dino")
  # String#include?(other_string) returns true if self contains other_string, false otherwise

p advice.match?("dino")
  # String#match?(pattern, offset = 0) returns true or false based on whether a match is found for self and pattern
