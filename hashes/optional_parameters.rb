def greeting(name, options = {})
    if options.empty?
        puts "Hi there! You must be #{name}!"
    else
        puts "You are #{name}"
        puts "#{options[:age]} years old."
        puts "From #{options[:city]}"
    end
end

puts "What is your name?"
n = gets.chomp
puts "How old are you?"
a = gets.chomp
puts "Where are you from?"
c = gets.chomp
greeting(n, age: a, city: c)