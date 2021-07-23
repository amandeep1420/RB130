require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  
  def test_prompt_for_payment
    transaction = Transaction.new(10)
    amount_paid = StringIO.new('10\n')
    catch_output = StringIO.new
    
    transaction.prompt_for_payment(input: amount_paid, output: catch_output)
    assert_equal(10, transaction.amount_paid)
  end
  
end