require 'oystercard'

describe Oystercard do

  it 'creates a new card' do
    is_expected.to respond_to(:top_up).with(1).argument
  end

  describe "#top_up" do

    it "balance increases by the amount topped up" do
      balance_before = subject.balance
      subject.top_up(10)
      expect((subject.balance) - balance_before).to eq(10)
    end

    it "raises error when the balance is higher then the max limit" do
      maximum_balance = Oystercard::MAXIMUM_CAPACITY
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error Oystercard::ERROR_MAXIMUM_BALANCE
    end
  end

  describe "#deduct" do
    it "deducts the fare amount from the balance" do
      subject.top_up(20)
      expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
    end

  end
end
