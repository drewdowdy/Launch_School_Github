require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    cost = 25
    transaction = Transaction.new(cost)
    good_input = StringIO.new("30\n")
    bad_to_good_input = StringIO.new("20\n35\n")

    transaction.prompt_for_payment(input: good_input)
    assert_equal(30, transaction.amount_paid)

    bad_output = <<~OUTPUT
    You owe $#{cost}.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $#{cost}.
    How much are you paying?
    OUTPUT

    assert_output(bad_output) do 
      transaction.prompt_for_payment(input: bad_to_good_input)
    end

    assert_equal(35, transaction.amount_paid)
  end
end
