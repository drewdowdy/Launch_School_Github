class Student
  attr_accessor :name
  
  def initialize(name, grade)
    @name = name
    @grade = grade
    puts "#{@name} has enrolled in the school."
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected 

  attr_accessor :grade
end

joe = Student.new('Joe', 95)
bob = Student.new('Bob', 75)

puts "Well done, Joe!" if joe.better_grade_than?(bob)
puts "Well done, Bob!" if bob.better_grade_than?(joe)

bob.grade
# in `<main>': protected method `grade' called for #<Student:0x0000000102291258 @name="Bob", @grade=75> (NoMethodError)
