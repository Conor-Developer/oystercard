class Oystercard
  attr_reader :balance

  ACCOUNT_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if @balance + amount >= ACCOUNT_LIMIT
      raise "Account limit of £#{ACCOUNT_LIMIT} exceeded"
    else
      @balance += amount
    end
  end
end