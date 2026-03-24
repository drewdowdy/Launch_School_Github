items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*foods, wheat|
  puts foods.join(', ')
  puts wheat
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |apples, corn, cabbage, wheat|
  # puts [apples, corn, cabbage].join(', ') + ', and ' + wheat
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
