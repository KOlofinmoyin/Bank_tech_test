require 'date'

class Bank
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :deposit_amount, :withdrawal_amount

  def initialize(balance = 0)
    @balance = balance
    @today = DateTime.now.strftime("%d/%m/%Y")
    @transactions = []
  end

  def make_a_deposit(deposit_amount)
    @deposit_amount = deposit_amount

    fail "Error: Your deposit must be at least £#{MINIMUM_AMOUNT}.00" unless @deposit_amount >= MINIMUM_AMOUNT

    @balance += @deposit_amount
    print_credit_transactions
  end

  def make_a_withdrawal(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount
    fail "Error: Your balance is £#{@balance}.00, and you cannot make a withdrawal. Try to arrange an overdraft." unless @withdrawal_amount <= @balance

    @balance -= @withdrawal_amount
      print_debit_transactions
  end

  def print_statement
    format_statement
  end

private

  def format_statement
    puts transaction  = 'date || credit || debit || balance '
    @transactions.reverse.each do |transaction|
      puts transaction
  end
end

  def print_debit_transactions
    @transactions << "#{@today} || || #{@withdrawal_amount} || #{@balance}"
  end

  def print_credit_transactions
    @transactions << "#{@today} || #{@deposit_amount} || || #{@balance}"
  end
end
