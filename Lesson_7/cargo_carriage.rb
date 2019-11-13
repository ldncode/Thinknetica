require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :size, :occupied_volume

  def initialize(size)
    @type = 'cargo'
    @size = size
    @occupied_volume = 0
  end

  def occupy(volume)
    @occupied_volume += volume if occupied_volume >= volume
  end
end
