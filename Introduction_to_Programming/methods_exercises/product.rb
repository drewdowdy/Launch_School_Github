#ex6: What does the error message tell you?

#ArgumentError: wrong number of arguments (1 for 2)
  #from (irb):1:in `calculate_product'
  #from (irb):4
  #from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

#only one argument was given to the method

def calculate_product(a, b)
    a * b
end

calculate_product(4)

#product.rb:10:in `calculate_product': wrong number of arguments (given 1, expected 2) (ArgumentError)
    #from product.rb:14:in `<main>'