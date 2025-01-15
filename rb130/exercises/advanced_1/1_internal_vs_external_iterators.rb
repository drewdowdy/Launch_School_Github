enumerator = Enumerator.new do |yielder| # <-- yielder is what is 'returned'?
  accumulator = 1
  number = 0

  loop do 
    accumulator = number.zero? ? 1 : accumulator * number
    # iteration stops when yielding
    yielder << accumulator # accumulator is 'returned'?
    # iteration resumes when #next is invoked again
    number += 1
  end
end

10.times { |n| puts "#{n}! == #{enumerator.next}" }

# enumerators don't know when to stop, so they need to be reset
enumerator.rewind
puts ''

5.times { |n| puts "#{n}! == #{enumerator.next}" }
