require 'bank.rb'

describe Bank do
  let(:natwest) { described_class.new }
  let(:today) { today = DateTime.now.strftime("%d/%m/%Y") }


  context "Make Deposit" do
    let(:deposit_amount)  { deposit_amount = 15000 }
    let(:invalid_amount) { invalid_amount = 0 }

    it "takes 15000 and returns '18/12/2019 || 15000 || || 15000'" do
      expect(natwest.make_a_deposit(deposit_amount)).to eq ["#{today} || #{deposit_amount} || || #{natwest.balance}"]
    end

    it "takes 0 and returns 'Error: Your deposit must be above £1.00'" do
      expect { natwest.make_a_deposit(0) }.to raise_error("Error: Your deposit must be at least £#{Bank::MINIMUM_AMOUNT}.00")
    end
  end

  context "Make Withdrawal" do
    let(:amount)  { amount = 15000 }
    let(:invalid_amount) { invalid_amount = 0 }
    let(:withdrawal_amount) { withdrawal_amount = 900 }

    it "takes 900 and returns '18/12/2019 || || 900 || 14100'" do
      natwest.make_a_deposit(amount)
      expect(natwest.make_a_withdrawal(withdrawal_amount)).to eq ["#{today} || #{amount} || || 15000"].push("#{today} || || #{withdrawal_amount} || #{natwest.balance}")

    end

    it "takes an amount less than User's balance and returns an Error exception." do
      natwest.make_a_deposit(1)
      expect { natwest.make_a_withdrawal(10) }.to raise_error("Error: Your balance is £#{natwest.balance}.00, and you cannot make a withdrawal. Try to arrange an overdraft.")
    end
  end

  context "Print Bank Statement" do
    let(:amount)  { amount = 15000 }
    let(:withdrawal_amount) { withdrawal_amount = 500 }


    describe '#print_statement' do

      it "takes the '#print_statement' method and prints historical (deposit & withdrawal) transaction details in reverse order." do
        natwest.make_a_deposit(amount)
        natwest.make_a_withdrawal(withdrawal_amount)
        expect(natwest.print_statement).to eq ["#{today} || || #{withdrawal_amount} || #{natwest.balance}", "18/12/2019 || #{amount} || || 15000"]
      end
    end

  end
end
