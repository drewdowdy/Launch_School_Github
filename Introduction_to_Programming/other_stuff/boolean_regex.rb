def has_a_b?(string)
    if string =~ /b/
        puts "It's got a 'b'!"
    else
        puts "No 'b' here.."
    end
end

puts "What word do you want to check?"
answer = gets.chomp
puts has_a_b?(answer)