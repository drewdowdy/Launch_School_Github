def execute(&block)
    block
end

p execute { puts "Hello from inside the execute method!" }

# nothing is printed (not called with '.call')
# returns a Proc object number