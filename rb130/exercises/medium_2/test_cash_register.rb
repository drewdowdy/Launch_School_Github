require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 5

    result = @cash_register.accept_money(@transaction)
    assert_equal(105, result)
  end
end
