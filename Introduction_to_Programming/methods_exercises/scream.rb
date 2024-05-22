#ex4: what does the following do?

def scream(words)
    words = words + "!!!!"
    return
    puts words
end

scream("Yippeeee")
    # => nil

#when 'return' is explicitly invoked, Ruby exits the method

def realscream(words)
    words = words + "!!!!"
    puts words
end

realscream("AHHHHH")

#this prints to screen but still returns nil