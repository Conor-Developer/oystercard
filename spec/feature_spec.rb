require_relative '../lib/oystercard'

describe '#Feature Test' do
  it 'Use a card to touch-in and out, which charges a fare' do
    card = Oystercard.new
    stationA = Station.new("Bank", 1)
    stationB = Station.new("Liverpool St", 3)
    card.top_up(50)
    card.touch_in(stationA)
    expect {card.touch_out(stationB) }.to change { card.balance }.by(-3)
  end
end