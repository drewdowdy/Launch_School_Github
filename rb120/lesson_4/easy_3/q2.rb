class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi # create `::hi` class method for `Hello`
    Greeting.new.greet("Hello") # instantiate `Greeting` and invoke `#greet` on the new object
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Fix the above code so the following does not raise an error:

Hello.hi
