# ex3: write a method that returns an all caps version of the string
    # the string cannot be longer than 10 characters

def caps(words)
    if words.length <= 10
        words.upcase
    else
        puts "oops, that's too long :( "
    end
end

puts "What do 10 characters do you want to capitalize? "
words = gets.chomp
puts caps(words)