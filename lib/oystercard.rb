class Oystercard
  attr_reader :balance

  ACCOUNT_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
