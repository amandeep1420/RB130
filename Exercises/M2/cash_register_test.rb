require 'minitest/autorun'

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  # def setup
  #   @register = CashRegister.new(20)
  #   @transaction = Transaction.new(5)
  #   @transaction.amount_paid = 10
  # end
  
  # def test_accept_money
  #   total = @register.total_money + @transaction.amount_paid
  #   assert_equal(total, @register.accept_money(@transaction))
  # end
  
  # def test_change
  #   amount_paid = @transaction.amount_paid
  #   item_cost = @transaction.item_cost
  #   difference = amount_paid - item_cost
    
  #   assert_equal(difference, @register.change(@transaction))
  # end
  
  def test_give_receipt
    register = CashRegister.new(100)
    transaction = Transaction.new(10)
    
    output = <<~OUTPUT.chomp
    You've paid $10.\n
    OUTPUT
    
    assert_output(output) do 
      register.give_receipt(transaction)
    end
  end
  
end