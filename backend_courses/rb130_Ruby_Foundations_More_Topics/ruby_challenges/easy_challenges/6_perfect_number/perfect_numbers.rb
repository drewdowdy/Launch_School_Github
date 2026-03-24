class PerfectNumber
  def self.classify(number)
    raise StandardError unless number >= 0

    aliquot_sum = get_divisors(number).sum
    
    case aliquot_sum
    when (...number) then 'deficient'
    when number      then 'perfect'
    when (number..)  then 'abundant'
    end
  end

  # allows us to create private methods used by a class method
  class << self
    private

    def get_divisors(number)
      (1...number).select do |divisor|
        number % divisor == 0
      end
    end
  end
end
