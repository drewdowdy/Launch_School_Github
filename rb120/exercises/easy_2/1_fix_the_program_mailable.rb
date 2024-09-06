module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable # mix in the `Mailable` module
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable # mix in the `Mailable` module
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new 
bob = Employee.new
betty.print_address
bob.print_address
