greetings = { a: 'hi' }
informal_greeting = greetings[:a]
  # `informal_greeting = greetings[:a].clone` would create a new object
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi there' }
  # the shovel operator modified the original object
