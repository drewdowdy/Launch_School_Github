module Coatable
  def coating
    "I'm covered in chocolate"
  end
end

class JaffaCake
  include Coatable # mixing in Coatable module
end

class Raisin
  include Coatable # mixing in Coatable module
end

snacks = [JaffaCake.new, Raisin.new]
snacks.each { |snack| puts snack.coating }

# We can achive polymorphism by using mixin modules.
