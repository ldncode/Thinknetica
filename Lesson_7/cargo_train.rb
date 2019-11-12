require_relative 'train'
require_relative 'carriage'

class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'cargo'
  end
end
