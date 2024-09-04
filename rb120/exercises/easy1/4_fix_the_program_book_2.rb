# We can fix this code by using the `attr_accessor` method on `:title` and `:book`, since the code invovokes both getter and setter methods for them

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.) # => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) # => book = "Snow Crash", by Neil Stephenson.

=begin
## Further Exploration

On one hand, the code is shorter if we instantiate new `Book` objects at the same time with an `#initialize` method. However, separating the steps into several lines could make it clearer to another human reading the code what exactly the instance variables are named and what their values are being set to.
=end