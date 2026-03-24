# Which is a class method? How do you call it?

# Within a class, after `def` we attach `self.` to the class method name. To call any class method, we attached the method to the class.

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer 
# calls the class method `::manufacturer`
