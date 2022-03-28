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
end
