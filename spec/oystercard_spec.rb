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
      expect { subject.top_up(110) }.to raise_error Oystercard::ERROR_MAXIMUM_BALANCE
    end
  end
end
