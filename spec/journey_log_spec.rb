require 'journey_log.rb'

describe JourneyLog do

  let(:entry_station) { double "entry_station", station_name: "Entry station", zone: 1}
  let(:exit_station) { double "exit_station", station_name: "Exit station", zone: 1}
  let(:journey) { {["Entry station", "1"]=>["Exit station", "1"]} }

  it 'should start a journey' do
    subject.start(entry_station)
    expect(subject.current_journey[:entry_station]).to eq entry_station
  end

  it 'should have a list of past journeys' do
    expect(subject.journeys).to eq []
  end

  it 'should finish journey and add_journey_history - Logs journeys' do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.list_of_journeys).to include(journey)
  end

  it '#print_list_of_journeys' do 
    subject.start(entry_station)
    subject.finish(exit_station)
    expect { subject.print_journey_history }.to output("Start of journey:\nStation: #{entry_station.station_name}, Zone: #{entry_station.zone}\nEnd of journey:\nStation: #{exit_station.station_name}, Zone: #{exit_station.zone}\n").to_stdout
  end

end