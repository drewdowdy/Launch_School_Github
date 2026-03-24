def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration

# implicit block
def compute_two(argument)
  block_given? ? yield(argument) : 'Does not compute.'
end

p compute_two(3) { |num| num + 4 } == 7
p compute_two('a') { |letter| letter + 'cdc'} == 'acdc'
p compute_two('hello') == 'Does not compute.'

#explicit block
def compute_three(arg, &block)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute_three(5) { |num| num + 5 } == 10
p compute_three('hello') { |greet| greet + ' world' } == 'hello world'
p compute_three('testing') == 'Does not compute.'
