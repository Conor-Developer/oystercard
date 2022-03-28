class Oystercard
  attr_reader :balance, :card_status

  ACCOUNT_LIMIT = 90

  def initialize
    @balance = 0
    @card_status = 'not in use'
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @card_status = 'in use' if in_journey? == false
  end

  def touch_out
    @card_status = 'not in use' if in_journey? == true
  end

  def in_journey?
    @card_status == 'in use'
  end
end
