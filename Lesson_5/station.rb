require_relative 'instance_counter'

class Station
  include InstanceCounter

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

end
