class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Bye')
  end
end

Greeting.new.greet('Greetings!')
Hello.new.hi
Goodbye.new.bye
