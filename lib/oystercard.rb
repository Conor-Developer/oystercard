class Oystercard
  attr_reader :balance, :card_status

  ACCOUNT_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @card_status = 'not in use'
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def touch_in
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @card_status = 'in use' if in_journey? == false
  end

  def touch_out
    @card_status = 'not in use' if in_journey? == true
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    @card_status == 'in use'
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
