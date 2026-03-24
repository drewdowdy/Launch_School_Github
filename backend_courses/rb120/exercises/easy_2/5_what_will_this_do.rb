# In this code, one `#dupdata` is an instance method and the other `::dupdata` is a class method. They are separate within the class and perform different actions.

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # => ByeBye
puts thing.dupdata     # => HelloHello


