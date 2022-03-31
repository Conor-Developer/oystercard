require_relative '../lib/station'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @zone = nil
  end

  def enter_station(enter_station)
    @exit_station = nil
    @entry_station = enter_station
  end

  def leave_station(exit_station)
    @entry_station = nil
    @exit_station = exit_station
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    if in_journey?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

end