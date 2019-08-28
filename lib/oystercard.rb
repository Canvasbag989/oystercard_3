class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAXIMUM_CAPACITY = 90
  ERROR_MAXIMUM_BALANCE = "Error! Maximum balance of £#{MAXIMUM_CAPACITY} exceeded"

  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail ERROR_MAXIMUM_BALANCE if @balance + amount > MAXIMUM_CAPACITY
    @balance += amount
  end

end
