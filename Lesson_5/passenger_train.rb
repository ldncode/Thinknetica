require_relative 'train'

class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'passenger'
  end
end
