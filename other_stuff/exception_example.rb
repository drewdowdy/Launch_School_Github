names = ["Bob", "Joe", "Steve", nil, "Frank"]

names.each do |name|
    begin
        puts "#{name}'s name has #{name.length} letters in it."
    rescue
        puts "Something went wrong!"
    end
end

# part of the 'Exception' class, 'rescue' allows us to tell the program what to do if it encounters an error or a problem