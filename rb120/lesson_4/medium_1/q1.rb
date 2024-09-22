class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Is `balance` on line 9 missing an `@`?

# No. Without the `@`, we are invoking the getter method `#balance`. And since there is an `attr_reader` for `:balance`, the `@` is not necessary.
