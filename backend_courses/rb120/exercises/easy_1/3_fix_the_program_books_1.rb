# To fix this code, we can add getter methods with `attr_reader` for `@author` and `@title` so their values can be viewed outside of the class.

class Book
  attr_reader :author, :title # add getter methods `#author` and `#title`

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.) 
# => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) 
# => book = "Snow Crash", by Neil Stephenson.

# %() is often used for strings that contain lots of single quotes `'` or double quotes `"`.

=begin
## Further Exploration

> What are the differences between `attr_reader`, `attr_writer`, and `attr_accessor`?

All of the accessor methods allow us to retrieve or change the values of instance variables within a class. `attr_reader` creates a getter method that allows us to call the getter method and see the value of an instance variable. `attr_writer` allows us to call the setter method and change the value of an instance variable. `attr_accessor` allows us to call both the getter and setter methods and view or change the value of the instance variable.

> Why did we use `attr_reader` instead of one of the other two? Would it be okay to use one of the others? Why or why not?

In this case, we are only calling getter methods `#title` and `#author`. We could set additional writer methods with `attr_writer` or `attr_accessor`, but it is not necessary since this program only uses getter methods.

> Instead of attr_reader, suppose you had added the following methods to this class:

```ruby
def title
  @title
end

def author
  @author
end
```

> Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?

By manually defining the getter and setter methods, we can add in more functionality within the definition if we wanted to.
=end
