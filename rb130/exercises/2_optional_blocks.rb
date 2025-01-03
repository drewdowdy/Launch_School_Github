def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration

def compute_2(argument)
  block_given? ? yield(argument) : 'Does not compute.'
end

p compute_2(3) { |num| num + 4 } == 7
p compute_2('a') { |letter| letter + 'cdc'} == 'acdc'
p compute_2('hello') == 'Does not compute.'
