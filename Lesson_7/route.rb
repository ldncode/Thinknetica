require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :start_station, :interval_stations, :final_station

  def initialize(start_station, final_station)
    @start_station = start_station
    @final_station = final_station
    @interval_stations = []
    register_instance
    valid?
  end

  def add_station(interval_station)
    @interval_stations << interval_station
  end

  def delete_station(interval_station)
    @interval_stations.delete(interval_station)
  end

  def all_stations
    [start_station, interval_stations, final_station].flatten
  end

  private

  def validate!
    if start_station == final_station
      raise ArgumentError, 'Укажите разные названия станций'
    end
  end
end
