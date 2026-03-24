class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      # success = (self.balance -= amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      # success = false
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end

    # if success
    #   "$#{amount} withdrawn. Total balance is $#{balance}."
    # else
    #   "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    # end
  end

  # def balance=(new_balance)
    # if valid_transaction?(new_balance)
      # @balance = new_balance
    #   true
    # else
    #   false
    # end
  # end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end

  protected

  attr_writer :balance
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50
p account.withdraw(40)
p account.balance


=begin

Error: on `line 21`, `success` references the difference assignment of the balance if the input number is greater than 0. Every positive integer will make this truthy.

Fix: 
  - refactor #withdraw so it only has one `if` statement.
  - remove the #balance= method and created a protected attr_writer for :balance (so that the user can't change the balance directly)

Note:
  Any setter method will always return it's argument, regardless of any explicit `return` keywords

Further Exploration:
  What will the return value of a setter method be if you mutate its argument in the method body?

=end

puts ''
puts 'Further Exploration:'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(string)
    string.upcase!
    # return 'Bobby'
  end
end

kitty = Cat.new('Mittens')
p kitty.name = 'Billy'
p kitty.name

=begin

If we mutate the argument passed into a setter method, then the return value is the now mutated argument. 

Any explicit 'return' is also ignored in a setter method.

=end
