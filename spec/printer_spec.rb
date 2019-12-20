require 'printer'

describe Printer do
  let(:printer) { described_class.new }
  let(:natwest) { double :natwest }
  let(:today) { DateTime.now.strftime('%d/%m/%Y') }
  let(:amount) { 15_000 }
  let(:withdrawal_amount) { 500 }
  let(:transactions) do
    [
      "#{@today} || 15000.00 || || 15000.00",
      "#{@today} ||  || 500.00 || 14500.00"
    ]
  end

  let(:format_statements)  do
    "date || credit || debit || balance
#{@today} ||  || 500.00 || 14500.00
#{@today} || 15000.00 || || 15000.00\n"
  end

  context 'Print Bank Statement' do
    it 'prints recent historical transaction details in reverse order.' do
      expect do
        printer.print_statement(transactions)
      end.to output(format_statements).to_stdout
    end
  end
end
