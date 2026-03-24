require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do 
  it 'has 4 wheels' do 
    car = Car.new
    _(car.wheels).must_equal 4
  end
end

# even though this sytax is different, it produces the same results
# this is more similar to RSpec (??)
