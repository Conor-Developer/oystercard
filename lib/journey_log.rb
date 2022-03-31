require_relative 'journey'
require_relative 'station'

class JourneyLog
  attr_reader :list_of_journeys

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @current_journey = {entry_station: nil, exit_station: nil}
    @list_of_journeys = []
  end

  def start(station) 
    @current_journey[:entry_station] = station
    @journey_class.enter_station(station)
  end

  def finish(station)
    @current_journey[:exit_station] = station
    add_journey_history
    @journey_class.leave_station(station)
  end

  def journeys
    @list_of_journeys.dup
  end

  def add_journey_history
    @list_of_journeys.push({["#{@current_journey[:entry_station].station_name}", "#{@current_journey[:entry_station].zone}"] => ["#{@current_journey[:exit_station].station_name}", "#{@current_journey[:exit_station].zone}"]})
    @current_journey[:entry_station] = nil
    @list_of_journeys.last
  end

  def print_journey_history
    @list_of_journeys.each do |hash|
      hash.each_with_index do |(_key, _value), index|
        puts 'Start of journey:'
        puts "Station: #{@list_of_journeys[index].keys[index][index]}, Zone: #{@list_of_journeys[index].keys[index][1]}" 
        puts 'End of journey:'
        puts "Station: #{@list_of_journeys[index].values[index][index]}, Zone: #{@list_of_journeys[index].values[index][1]}" 
      end
    end
  end

  def current_journey
    @current_journey ||= journey_class.new
  end

end
