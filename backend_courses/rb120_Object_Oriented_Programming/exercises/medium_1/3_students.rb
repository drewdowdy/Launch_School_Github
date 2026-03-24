=begin

Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

** Note, you can do this by adding or altering no more than 5 lines of code.

=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student      # alteration (1)
  def initialize(name, year, parking)
    super(name, year)         # addition (2)
    @parking = parking        # addition (3)
  end
end

class Undergraduate < Student # alteration (4)
  def initialize(name, year)
    super                     # addition (5)
  end
end

# Further Exploration

# There is one other "form" of the keyword super. We can call it as super(). This calls the superclass method of the same name as the calling method, but here no arguments are passed to the superclass method at all.

# Can you think of a way to use super() in another Student related class?

# ~~~~~~~~~~~~~~~~~~~~

# If the superclass has a default value, we can use `super()` to set any instance variables to the default values of the superclass. 

class Student
  def initialize(name='Generic Name', year='Generic Year')
    @name = name
    @year = year
  end
end

class Undergraduate < Student
  def initialize
    super()
  end
end

generic_student = Undergraduate.new

p generic_student
# => #<Undergraduate:0x0000000104550e88 @name="Generic Name", @year="Generic Year">
