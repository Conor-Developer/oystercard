require_relative '../lib/oystercard'

describe Oystercard do
  it '#balance - checks balance' do
    expect(subject).to respond_to(:balance)
  end
  it '#top_up - checks that balance is increased by the amount added' do
  expect(subject.top_up(10)).to eq(10)
  end
end
