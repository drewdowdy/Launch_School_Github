=begin

=== RULES ===

- needs a #put method
  - inserts argument into buffer
- needs a #get method
  - removes and returns the oldest object

=== BRAINSTORM ===

- what data structure is best?
  - array: simple and indexed 

=end

class CircularBuffer
  def initialize(limit)
    @array = Array.new(limit)
    @limit = limit
    @newest_index = 0
    @oldest_index = 0
  end
  
  def put(item)
    @oldest_index = increment_idx(@oldest_index) unless @array[@newest_index].nil?
    @array[@newest_index] = item
    @newest_index = increment_idx(@newest_index) 
  end
  
  def get
    oldest_item = @array[@oldest_index]
    @array[@oldest_index] = nil
    @oldest_index = increment_idx(@oldest_index) unless oldest_item.nil?
    oldest_item
  end
  
  private

  def increment_idx(idx)
    (idx + 1) % @limit
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil # => true

buffer.put(1)
buffer.put(2)
puts buffer.get == 1 # => true

buffer.put(3)
buffer.put(4)
puts buffer.get == 2 # => true

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5 # => true
puts buffer.get == 6 # => true
puts buffer.get == 7 # => true
puts buffer.get == nil # => true


buffer = CircularBuffer.new(4)
puts buffer.get == nil # => true

buffer.put(1)
buffer.put(2)
puts buffer.get == 1 # => true

buffer.put(3)
buffer.put(4)
puts buffer.get == 2 # => true

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4 # => true
puts buffer.get == 5 # => true
puts buffer.get == 6 # => true
puts buffer.get == 7 # => true

puts buffer.get == nil # => true

# Further Exploration

# Phew. That's a lot of work, but it's a perfectly acceptable solution to this exercise. However, there is a simpler solution that uses an Array, and the #push and #shift methods. See if you can find a solution that does this. And no, you're not allowed to monkey-patch the Array class, though doing so may help you determine what needs to be done.

class CircularBuffer
  def initialize(limit)
    @array = []
    @limit = limit
  end
  
  def put(item)
    @array.shift if @array.size >= @limit
    @array.push(item)
  end
  
  def get
    @array.shift
  end
end
