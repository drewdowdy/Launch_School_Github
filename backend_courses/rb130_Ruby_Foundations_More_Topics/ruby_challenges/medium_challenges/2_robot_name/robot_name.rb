=begin

=== PROBLEM ===

write a program that produces a unique name for a robot

rules:
- names are composed of 2 uppercase letters followed by 3 digits 0-9
  - eg. BX369, AV427
- names must never be repeated
- names must be random or have no dicernable pattern
- 

=== DEBUG ===

- robot names need to be unique everytime, even with 

=end


class Robot
  attr_reader :name
  @@old_names = []

  def initialize
    @name = generate_unique_name
    @@old_names << name
  end

  def reset
    @@old_names.delete(@name)
    @name = generate_unique_name
    @@old_names << @name
  end

  private

  def create_name
    result = ''
    2.times { result += rand(65..90).chr }
    3.times { result += rand(0..9).to_s }
    result
  end

  def generate_unique_name
    loop do 
      new_name = create_name
      return new_name unless @@old_names.include?(new_name)
    end
  end
end
