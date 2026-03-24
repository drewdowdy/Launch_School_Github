require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError
  def initialize(msg='Error: Employee has no experience.')
    super(msg)
  end
end

class Employee
  attr_reader :experience
  
  def initialize(experience=nil)
    @experience = experience
  end

  def hire
    raise NoExperienceError unless experience

    puts "You're hired!"
  end
end

class TestExemptions < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_exemption
    assert_raises(NoExperienceError) do 
      @employee.hire
    end
  end
end
