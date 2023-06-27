hash = { a: 1, b: 2, c: 3 }

puts "What nummber value do you want to check? "
answer = gets.chomp.to_i

if hash.value?(answer)
    puts "That's a value in this hash! :) "
else
    puts "Sorry, not a value in this hash :( "
end

