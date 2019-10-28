require_relative 'station'
require_relative 'train'

class Route
  attr_reader :start_station, :interval_stations, :final_station

  def initialize(start_station, final_station)
    @start_station = start_station
    @final_station = final_station
    @interval_stations = []
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
end



