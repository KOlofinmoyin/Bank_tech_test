# frozen_string_literal: true

require 'bank.rb'

describe Bank do
  let(:natwest) { described_class.new }
  let(:today) { DateTime.now.strftime('%d/%m/%Y') }
  let(:amount) { 15_000 }
  let(:withdrawal_amount) { 500 }

  context 'Make Deposit' do
    it "takes 15000 and returns '18/12/2019 || 15000 || || 15000'" do
      expect(natwest.make_a_deposit(amount)).to eq ["#{today} || #{amount} || || #{natwest.balance}"]
    end

    it "takes 0 and returns 'Error: Your deposit must be above £1.00'" do
      expect { natwest.make_a_deposit(0) }.to raise_error("Error: Your deposit must be at least £#{Bank::MINIMUM_AMOUNT}.00")
    end
  end

  context 'Make Withdrawal' do
    let(:invalid_amount) { 0 }
    it "takes 900 and returns '18/12/2019 || || 900 || 14100'" do
      natwest.make_a_deposit(amount)
      expect(natwest.make_a_withdrawal(withdrawal_amount)).to eq ["#{today} || #{amount} || || 15000"].push("#{today} || || #{withdrawal_amount} || #{natwest.balance}")
    end

    it "takes an amount < User's balance and returns an Error exception." do
      expect { natwest.make_a_withdrawal(10) }.to raise_error("Error: Your balance is £#{natwest.balance}.00, you cannot make a withdrawal.")
    end
  end

  context 'Print Bank Statement' do
    it 'it prints recent historical transaction details in reverse order.' do
      natwest.make_a_deposit(amount)
      natwest.make_a_withdrawal(withdrawal_amount)
      expect(natwest.print_statement).to eq ["#{today} || || #{withdrawal_amount} || #{natwest.balance}", "18/12/2019 || #{amount} || || 15000"]
    end
  end
end
