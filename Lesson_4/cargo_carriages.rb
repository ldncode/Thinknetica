require_relative 'carriages'

class CargoCarriages < Carriages
  attr_reader :size
  def initialize(size)
    @type = 'cargo'
    @size = size
  end
end
