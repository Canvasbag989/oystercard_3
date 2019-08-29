require 'oystercard'

describe Oystercard do

  let(:station){ double :station }

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

  describe "#state of card" do

    it { is_expected.to respond_to(:in_journey?) }

    it "will be in journey when card touches in" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it "will not be in journey when the card touches out" do
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it "it will raise an error unless the balance is at least £1" do
      expect{ subject.touch_in(station) }.to raise_error Oystercard::ERROR_MINIMUM_BALANCE
    end

    it "will reduce the correct fare amount when the journey is complete" do
      subject.top_up(5)
      minimum_balance = Oystercard::MINIMUM_BALANCE
      expect{ subject.touch_out }.to change{ subject.balance }.by -minimum_balance
    end
  end

  describe '#station' do

    it "will remember entry station after touch in" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end



  end
end
