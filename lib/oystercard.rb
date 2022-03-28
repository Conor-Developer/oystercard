class Oystercard
  attr_reader :balance, :entry_station

  ACCOUNT_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE

    @entry_station = station if in_journey? == false
  end

  def touch_out
    @entry_station = nil if in_journey? == true
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
