def has_a_b?(string)
    if /b/.match(string)
        puts "There's a 'b' in there!"
    else
        puts "No 'b' in there."
    end
end

puts "What word do you want to check?"
answer = gets.chomp
puts has_a_b?(answer)