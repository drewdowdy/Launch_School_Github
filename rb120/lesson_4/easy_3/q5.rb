class Television
  def self.manufacturer
    puts "manugacturer method logic"
  end

  def model
    puts "model method logic"
  end
end

# What happpens?

tv = Television.new
tv.manufacturer         # => NoMethodError
tv.model                # => #model executes

Television.manufacturer # => ::manufacturer executes
Television.model        # => NoMethodError
