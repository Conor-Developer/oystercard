require_relative '../lib/station'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :fare_cost

  def initialize
    @zone = nil
  end

  def enter_station(enter_station)
    @exit_station = nil
    @entry_zone = enter_station.zone
    @entry_station = enter_station
  end

  def leave_station(exit_station)
    @exit_station = exit_station
    @entry_station = nil
    @exit_zone = @exit_station.zone
    fare
    @exit_station
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    if in_journey?
      @fare_cost = PENALTY_FARE
    else
      @fare_cost = (@entry_zone - @exit_zone).abs + MINIMUM_FARE
    end
  end

end