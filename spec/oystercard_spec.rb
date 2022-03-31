require_relative '../lib/oystercard'
require_relative '../lib/station'

describe Oystercard do

  let(:station) { double :station }

  it '#balance - checks balance' do
    expect(subject).to respond_to(:balance)
  end
  it '#top_up - checks that balance is increased by the amount added' do
    expect(subject.top_up(10)).to eq(10)
  end
  it '#top_up - balance does not exceed account limit and error is raised' do
    expect { subject.top_up(100) }.to raise_error('Account limit of £90 exceeded')
  end

  it '#touch_in - raise error: Insufficient funds' do
    expect { subject.touch_in(station) }.to raise_error('Insufficient funds')
  end

  it '#touch_out - will reduce balance my minimum fare amount' do
    subject.top_up(1)
    subject.touch_in(double(station_name: station, zone: 1))
    expect { subject.touch_out(double(station_name: station, zone: 1)) }.to change { subject.balance }.by(-1)
  end

end
