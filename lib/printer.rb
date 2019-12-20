class Printer
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    format_statement(transactions)
  end

  private

  def format_statement(transactions)
    puts transactions.reverse
  end
end
