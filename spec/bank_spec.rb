# frozen_string_literal: true

require 'bank.rb'

describe Bank do
  let(:natwest) { described_class.new }
  let(:today) { DateTime.now.strftime('%d/%m/%Y') }
  let(:amount) { 15_000 }
  let(:withdrawal_amount) { 500 }

  context 'Make Deposit' do
    it "takes 15000 and returns '18/12/2019 || 15000.00 || || 15000.00'" do
      expect(natwest.make_a_deposit(amount)).to eq ["#{today} || #{'%.2f' % amount} || || #{'%.2f' % natwest.balance}"]
    end

    it "takes 0 and returns 'Error: Your deposit must be above £1.00'" do
      expect { natwest.make_a_deposit(0) }.to raise_error("Error: Your deposit must be at least £#{format('%.2f', Bank::MINIMUM_AMOUNT)}")
    end
  end

  context 'Make Withdrawal' do
    let(:invalid_amount) { 0 }
    it "takes 900 and returns '18/12/2019 || || 900.00 || 14100.00'" do
      natwest.make_a_deposit(amount)
      expect(natwest.make_a_withdrawal(withdrawal_amount)).to eq ["#{today} || #{'%.2f' % amount} || || 15000.00"].push("#{today} || || #{'%.2f' % withdrawal_amount} || #{'%.2f' % natwest.balance}")
    end

    it "takes an amount < User's balance and returns an Error exception." do
      expect { natwest.make_a_withdrawal(10) }.to raise_error("Error: Your balance is £#{'%.2f' % natwest.balance}, you cannot make a withdrawal.")
    end
  end
end
