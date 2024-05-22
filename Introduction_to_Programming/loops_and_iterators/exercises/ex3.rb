def countdown(number)
    print "#{number}, "
    if number > 0
        print countdown(number - 1)
    else
        puts "FINISH"
    end
end

puts "What should we countdown from?"
num = gets.chomp.to_i
countdown(num)