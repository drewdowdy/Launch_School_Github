talk = Proc.new do
    puts "I am talking."
end
talk.call

talk2 = Proc.new do |name|
    puts "I am talking to #{name}."
end
puts "Who should I talk to?"
answer = gets.chomp
talk2.call answer