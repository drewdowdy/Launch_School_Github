# We can fix this code by adding an `attr_reader` for `amount` after a `protected` method, allowing us to access the information of `#amount` without giving the user direct access to the method outside the class.

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected # add `protected` method

  attr_reader :amount # add `attr_reader`
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)

if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin

## Further Exploration

> This example is rather contrived and unrealistic, but this type of situation occurs frequently in applications. Can you think of any applications where protected methods would be desirable?

In a situation where we want to compare sensitive information between objects of the same class but without giving the user explicit access to such information.

For example, comparing financial information, passwords, or ID information between users.

=end
