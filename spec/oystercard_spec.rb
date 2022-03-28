require_relative '../lib/oystercard'

describe Oystercard do
  it '#balance - checks balance' do
    expect(subject).to respond_to(:balance)
  end
end
