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
    if amount > 0 && (balance - amount) >= 0
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


=begin

Error: on `line 21`, `success` references the difference assignment of the balance if the input number is greater than 0. Every positive integer will make this truthy.

Fix: 
  - refactor #withdraw so it only has one `if` statement.
  - remove the #balance= method and created a protected attr_writer for :balance (so that the user can't change the balance directly)

=end
