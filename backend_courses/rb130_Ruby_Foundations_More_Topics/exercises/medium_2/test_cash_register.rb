require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 30

    result = register.accept_money(transaction)
    assert_equal(130, result)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 30

    result = register.change(transaction)
    assert_equal(5, result)
  end

  def test_give_reciept
    register = CashRegister.new(100)
    item_cost = 25
    transaction = Transaction.new(item_cost)
    
    assert_output("You've paid $#{item_cost}.\n") do 
      register.give_receipt(transaction)
    end
  end
end
