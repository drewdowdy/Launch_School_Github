def take_block(number, &block)
    block.call(number)
end

puts "What number?"
number = gets.chomp
take_block(number) do |num|
    puts "Block being called in the method! #{num}"
end