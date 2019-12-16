require 'date'

class Bank
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :deposit_amount

  def initialize(balance = 0)
    @balance = balance
    @today = DateTime.now.strftime("%d/%m/%Y")
  end

  def make_a_deposit(deposit_amount)
    @deposit_amount = deposit_amount
    @balance += @deposit_amount

    fail "Error: Your deposit must be at least £#{MINIMUM_AMOUNT}.00" unless @deposit_amount >= MINIMUM_AMOUNT

    "You've deposited £#{@deposit_amount}.00 on #{@today} and your balance is: £#{@balance}.00"
  end

  def make_a_withdrawal(deposit_amount)
    @withdrawal_amount = deposit_amount
    fail "Error: Your balance is £#{@balance}.00, and you cannot make a withdrawal. Try to arrange an overdraft." unless @withdrawal_amount <= @balance

    @balance -= @withdrawal_amount
    "You've withdrawn £#{@withdrawal_amount}.00 on #{@today} and your balance is: £#{@balance}.00"
  end

  def print_statement_heading
    "date || credit || debit || balance"
  end

  def print_debit_transactions
    "#{@today} || || #{@withdrawal_amount}.00 || #{@balance}.00 \n"
  end

  def print_credit_transactions
    "#{@today} || #{@deposit_amount}.00 || || #{@balance}.00 \n"
  end
end
