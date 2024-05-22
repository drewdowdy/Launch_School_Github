words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |x|
    if /lab/ =~ x || /Lab/ =~ x
        puts x
    else
        puts "#{x} doesn't contain 'lab'"
    end
end
