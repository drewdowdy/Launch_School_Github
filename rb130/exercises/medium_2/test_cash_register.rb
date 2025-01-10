require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < Minitest::Test
  def setup

  end

  def test_change(transaction)

  end

  def test_give_receipt(transaction)

  end

  def test_accept_money(transaction)

  end

  def test_start_transaction(transaction)

  end
end