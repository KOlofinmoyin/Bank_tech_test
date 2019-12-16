require 'bank.rb'

describe Bank do
  let(:natwest) { described_class.new }
  let(:today) { today = DateTime.now.strftime("%d/%m/%Y") }


  context "Make Deposit" do
    let(:amount)  { amount = 1000 }
    let(:invalid_amount) { invalid_amount = 0 }

    it "takes 1000 and returns You've deposited £1000.00 on 16/12/2019 and your balance is: £1000.00" do
      expect(natwest.make_a_deposit(amount)).to eq "You've deposited £#{amount}.00 on #{today} and your balance is: £#{natwest.balance}.00"
    end

    it "takes 0 and returns 'Error: Your deposit must be above £1.00'" do
      expect { natwest.make_a_deposit(0) }.to raise_error("Error: Your deposit must be at least £#{Bank::MINIMUM_AMOUNT}.00")
    end
  end

  context "Make Withdrawal" do
    let(:amount)  { amount = 3000 }
    let(:invalid_amount) { invalid_amount = 0 }
    let(:withdrawal_amount) { withdrawal_amount = 500 }

      it "takes 500 and returns You've withdrawn 500 on 16/12/2019 and your balance is: £2500.00" do
        natwest.make_a_deposit(amount)
        expect(natwest.make_a_withdrawal(withdrawal_amount)).to eq "You've withdrawn £#{withdrawal_amount}.00 on #{today} and your balance is: £#{natwest.balance}.00"
      end

      it "takes an amount less than User's balance and returns an Error exception." do
        natwest.make_a_deposit(1)
        expect { natwest.make_a_withdrawal(10) }.to raise_error("Error: Your balance is £#{natwest.balance}.00, and you cannot make a withdrawal. Try to arrange an overdraft.")
      end
  end

  context "Print Bank Statement" do

    it "takes the 'Print' method and returns statement heading." do
      expect(natwest.print_statement_heading).to eq "date || credit || debit || balance"
    end
  end
end
