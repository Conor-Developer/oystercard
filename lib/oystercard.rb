require_relative './journey'

class Oystercard
  attr_reader :balance, :journey

  ACCOUNT_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @journey.enter_station(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey.leave_station(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
