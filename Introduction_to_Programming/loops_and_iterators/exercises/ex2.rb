#loop do
#    puts "Now what do you want to yell? "
#    a = gets.chomp
#    if a == "stop"
#        break
#    else
#        puts "#{a.upcase}"
#    end
#end

puts "Hey, what's up?"
x = gets.chomp
while x != "STOP" do
    puts "Maybe you didn't hear me... WHATS UP?? "
    x = gets.chomp
end
