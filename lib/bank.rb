
class Bank
  def initialize(balance = 0)
    @balance = balance
  end

  def make_a_deposit(amount)
    @amount = amount
    @balance += @amount
    @amount > 0 ? "You've deposited £#{@amount}.00 on 16/12/2012 and your balance is: £#{@balance}.00" : "Error: Your deposit must be above £0.00"
  end
end
