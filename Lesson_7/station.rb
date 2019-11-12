require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

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
    validate!
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

  def each_train
    @trains.each {|train| yield train }
  end

  private

  def validate!
    if name.empty?
      raise ArgumentError, 'Введите название станции'
    end
  end

end
