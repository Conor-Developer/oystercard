require_relative '../lib/oystercard'

describe Oystercard do
  it '#balance - checks balance' do
    expect(subject).to respond_to(:balance)
  end
  it '#top_up - checks that balance is increased by the amount added' do
    expect(subject.top_up(10)).to eq(10)
  end
  it '#top_up - balance does not exceed account limit and error is raised' do
    expect { subject.top_up(100) }.to raise_error('Account limit of £90 exceeded')
  end

  it '#deduct - Reduce balance by the specified amount' do
    expect(subject.deduct(10)).to eq(-10)
  end

  it '#touch_in - Changes travel state of card' do
    subject.top_up(1)
    subject.touch_in
    expect(subject.card_status).to eq('in use')
  end

  it '#touch_out - Changes travel state of card' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject.card_status).to eq('not in use')
  end

  it '#in_journey? - To return true ' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it '#in_journey? - To return false ' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it '#touch_in - raise error: Insufficient funds' do
    expect {subject.touch_in}.to raise_error('Insufficient funds')
  end 
end
