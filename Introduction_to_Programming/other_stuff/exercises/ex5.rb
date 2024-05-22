def execute(block)
    block.call
end

p execute { puts "Hello from inside the execute method!" }

# ex5.rb:1:in `execute': wrong number of arguments (given 0, expected 1) (ArgumentError)
# from ex5.rb:5:in `<main>'

# we did not lable the 'block' parameter with an '&' so it can't be passed