require 'date'

class Bank
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def make_a_deposit(amount)
    @amount = amount
    @balance += @amount
    fail "Error: Your deposit must be above £0.00" unless @amount > 0
    "You've deposited £#{@amount}.00 on 16/12/2019 and your balance is: £#{@balance}.00"
  end
end
