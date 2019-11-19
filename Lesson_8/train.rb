# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include Producer
  include InstanceCounter
  include Validation

  attr_accessor :speed, :carriages
  attr_reader :name, :type, :route, :current_station

  FORMAT_NUMBER = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  @@all_trains = {}

  def self.find(id)
    @@all_trains[id]
  end

  def initialize(name, type)
    @speed = 0
    @name = name
    @type = type
    @@all_trains[name] = self
    register_instance
    validate!
    @carriages = []
  end

  def add_wagon(wagon)
    @carriages << wagon if speed.zero? && wagon.type == type
  end

  def unhook(wagon)
    @carriages.delete(wagon) if speed.zero?
  end

  def add_route(route)
    @route = route
    @current_station = route.start_station
    @current_station.arrival(self)
  end

  def station_index
    @route.all_stations.index(current_station)
  end

  def next_station
    @route.all_stations[station_index + 1]
  end

  def prev_station
    @route.all_stations[station_index - 1] if station_index != 0
  end

  def forward
    return if next_station.nil?

    @current_station.out(self)
    @current_station = next_station
    @current_station.arrival(self)
  end

  def backward
    return if prev_station.nil?

    @current_station.out(self)
    @current_station = prev_station
    @current_station.arrival(self)
  end

  def each_carriage
    @carriages.each { |carriage| yield carriage }
  end

  private

  def validate!
    raise ArgumentError, 'Введите корректный номер' if name !~ FORMAT_NUMBER
  end
end
