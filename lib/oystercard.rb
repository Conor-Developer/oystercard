class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :list_of_journeys

  ACCOUNT_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "Account limit of £#{ACCOUNT_LIMIT} exceeded" if @balance + amount >= ACCOUNT_LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE

    @entry_station = station if in_journey? == false
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    add_journey_history
  end

  def in_journey?
    @entry_station != nil
  end

  def print_journey_history
    @list_of_journeys.each do |hash|
      hash.each_with_index do |(_key, _value), index|
        puts 'Start of journey:'
        puts "Station: #{@list_of_journeys[index].keys[index][index]}, Zone: #{@list_of_journeys[index].keys[index][1]}\n\n" 
        puts 'End of journey:'
        puts "Station: #{@list_of_journeys[index].values[index][index]}, Zone: #{@list_of_journeys[index].values[index][1]}\n\n" 
      end
    end
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_journey_history
    @list_of_journeys.push({["#{@entry_station.station_name}", "#{@entry_station.zone}"] => ["#{@exit_station.station_name}", "#{@exit_station.zone}"]})
    @entry_station = nil
    @exit_station = nil
  end
end
