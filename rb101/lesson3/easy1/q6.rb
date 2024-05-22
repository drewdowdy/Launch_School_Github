famous_words = "seven years ago..."

p "Four score and " + famous_words # addition operator

p ("Four score and ").concat(famous_words) # String#concat

p ["Four score and", famous_words].join(" ") # Array#join(separator)

p famous_words.prepend("Four score and ") # String#prepend

p "Four score and " << famous_words # shovel operator