require 'bank.rb'

describe Bank do
  context "Make deposit" do
    let(:natwest) { described_class.new }
    let(:amount)  { amount = 1000 }

    it "takes 1000 and returns You've deposited £1000.00 on 16/12/2012 and your balance is: £1000.00" do
      expect(natwest.make_a_deposit(amount)).to eq "You've deposited £#{amount}.00 on 16/12/2012 and your balance is: £1000.00"
    end

  end
end
