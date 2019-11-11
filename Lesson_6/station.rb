require_relative 'instance_counter'

class Station
  include InstanceCounter
  include Valididation

  attr_reader :train

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    valid?
  end

  def arrival(train)
    @trains << train
  end

  def out(train)
    @trains.delete(train)
  end

  def all_train_current
    puts @trains
  end

  private

  def validate!
    if name.empty?
      raise ArgumentError, 'Введите название станции'
    end
  end

end
