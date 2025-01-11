require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 30

    result = @cash_register.accept_money(@transaction)
    assert_equal(130, result)
  end

  def test_change
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 30

    result = @cash_register.change(@transaction)
    assert_equal(5, result)
  end
end
