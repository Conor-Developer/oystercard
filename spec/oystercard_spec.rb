require_relative '../lib/oystercard'

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

  it '#in_journey? - To return true ' do
    subject.top_up(1)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it '#in_journey? - To return false ' do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it '#touch_in - raise error: Insufficient funds' do
    expect { subject.touch_in(station) }.to raise_error('Insufficient funds')
  end

  it '#touch_out - will reduce balance my minimum fare amount' do
    subject.top_up(1)
    subject.touch_in(double(:entry_station => 'Bank'))
    expect {subject.touch_out}.to change {subject.balance}.by(-1)
  end

  it '#touch_in - entry_station variable to return station location' do
    subject.top_up(1)
    subject.touch_in(station)
    expect(subject).to have_attributes(:entry_station => station)
  end

  it '#touch_out - entry_station variable to return nil' do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).to have_attributes(:entry_station => nil)
  end
end
