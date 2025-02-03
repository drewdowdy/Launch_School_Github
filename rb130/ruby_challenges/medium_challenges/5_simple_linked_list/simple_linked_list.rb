=begin

=== PROBLEM ===

create a linked list where each element in the list contains data of the next element in the list

Rules:
- data will be numbers 1-10
- provide a method to reverse the list
- provide a method to convert the list to an array

=== DATA ===

A SimpleLinkedList will contian a number of Element objects. 
Each Element object has some 'next' attribute that points to the next object in the SimpleLinkedList collection

'tail' is the last object in list
'head' is the first object in list

=end
class Element
  attr_reader :datum, :next

  def initialize(datum, next_val=nil)
    @datum = datum
    @next = next_val
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def empty?
    head.nil?
  end

  def size
    size = 0
    current = head

    while current
      size +=1
      current = current.next
    end

    size
  end

  def push(datum)
    new_element = Element.new(datum, head)
    self.head = new_element
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def pop
    result = head.datum
    self.head = head.next
    result
  end

  def self.from_a(collection)
    list = SimpleLinkedList.new

    collection.reverse.each { |e| list.push(e) } unless collection.nil?

    list
  end

  def to_a
    array = []
    current = head

    while current
      array << current.datum
      current = current.next
    end

    array
  end

  def reverse
    list = SimpleLinkedList.new
    current = head

    while current
      list.push(current.datum)
      current = current.next
    end
    
    list
  end

  private

  attr_writer :head
end

