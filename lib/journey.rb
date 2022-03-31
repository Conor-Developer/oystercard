require_relative '../lib/station'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :list_of_journeys

  def initialize
    @zone = nil
    @list_of_journeys = []
  end

  def enter_station(enter_station)
    @entry_station = enter_station
    @exit_station = nil
  end

  def leave_station(exit_station)
    @exit_station = exit_station
    add_journey_history
  end

  def in_journey?
    @entry_station != nil
  end

  def add_journey_history
    @list_of_journeys.push({["#{@entry_station.station_name}", "#{@entry_station.zone}"] => ["#{@exit_station.station_name}", "#{@exit_station.zone}"]})
    @entry_station = nil
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

  def fare
    if in_journey?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

end