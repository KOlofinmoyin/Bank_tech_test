# frozen_string_literal: true

require 'date'

class Bank
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :deposit_amount, :withdrawal_amount

  def initialize(balance = 0, printer = Printer.new)
    @balance = balance
    @today = DateTime.now.strftime('%d/%m/%Y')
    @transactions = []
    @printer = printer
  end

  def make_a_deposit(deposit_amount)
    @deposit_amount = deposit_amount

    raise "Error: Your deposit must be at least £#{format('%.2f', MINIMUM_AMOUNT)}" unless @deposit_amount >= MINIMUM_AMOUNT

    @balance += @deposit_amount
    print_credit_transactions
  end

  def make_a_withdrawal(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount
    raise "Error: Your balance is £#{format('%.2f', @balance)}, you cannot make a withdrawal." unless @withdrawal_amount <= @balance

    @balance -= @withdrawal_amount
    print_debit_transactions
  end

  def print_statement
    @printer.print_statement(@transactions)
  end

  def print_debit_transactions
    @transactions << "#{@today} || || #{format('%.2f', @withdrawal_amount)} || #{format('%.2f', @balance)}"
  end

  def print_credit_transactions
    @transactions << "#{@today} || #{format('%.2f', @deposit_amount)} || || #{format('%.2f', @balance)}"
  end
end
