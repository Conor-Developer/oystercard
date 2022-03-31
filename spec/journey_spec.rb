require_relative '../lib/journey'

describe Journey do

  let(:station) { double "station", station_name: "station", zone: 1}
  let(:station2) { double "station", station_name: "station", zone: 2}

  it '#entry_station - Logs entry station' do
    subject.enter_station(station)
    expect(subject.entry_station).to eq(station)
  end

  it '#exit_station - Logs exit station' do
    subject.enter_station(station)
    subject.leave_station(station)
    expect(subject.exit_station).to eq(station)
  end

  it '#in_journey? - Returns true during journey' do
    subject.enter_station(station)
    expect(subject).to be_in_journey
  end

  it '#in_journey? - Returns false during non-journey' do
    expect(subject).not_to be_in_journey
  end
  

  it '#fare - charge minimum fare upon journey completion' do
    subject.enter_station(station)
    subject.leave_station(station)
    expect(subject.fare).to eq(1)
  end

  it '#fare - charge penalty fare if incomplete journey' do
    subject.enter_station(station)
    expect(subject.fare).to eq(6)
  end

  it '#fare - Charges more with different zones' do
    subject.enter_station(station)
    subject.leave_station(station2)
    expect(subject.fare).to eq 2
  end
end
