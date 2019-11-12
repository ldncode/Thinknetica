require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :size, :overall, :occupied_volume, :vacant_volume

  def initialize(size, overall)
    @type = 'cargo'
    @size = size
    @overall = overall
    @occupied_volume = 0
    @vacant_volume = @overall - @occupied_volume
  end

  def occupy(volume)
    @occupied_volume += volume
  end
end
