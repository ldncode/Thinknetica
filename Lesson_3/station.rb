require_relative 'train'
require_relative 'route'

class Station
  attr_reader :train

  def initialize(name)
    @name = name
    @trains = []
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
