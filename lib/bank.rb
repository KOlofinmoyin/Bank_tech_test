require 'date'

class Bank
  MINIMUM_AMOUNT = 1
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @today = DateTime.now.strftime("%d/%m/%Y")
  end

  def make_a_deposit(amount)
    @amount = amount
    @balance += @amount

    fail "Error: Your deposit must be above £#{MINIMUM_AMOUNT}.00" unless @amount > MINIMUM_AMOUNT

    "You've deposited £#{@amount}.00 on #{@today} and your balance is: £#{@balance}.00"
  end

  def make_a_withdrawal(amount)
    @withdrawal_amount = amount
    @balance -= @withdrawal_amount
    "You've withdrawn £#{@withdrawal_amount}.00 on 16/12/2012 and your balance is: £#{@balance}.00"
  end
end
