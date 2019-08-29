class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0
  MAXIMUM_CAPACITY = 90
  MINIMUM_BALANCE = 1
  ERROR_MINIMUM_BALANCE = "Insufficient balance to touch in"
  ERROR_MAXIMUM_BALANCE = "Error! Maximum balance of £#{MAXIMUM_CAPACITY} exceeded"

  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
    @entry_station = entry_station #nil?
  end

  def top_up(amount)
    fail ERROR_MAXIMUM_BALANCE if @balance + amount > MAXIMUM_CAPACITY
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    fail ERROR_MINIMUM_BALANCE if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
