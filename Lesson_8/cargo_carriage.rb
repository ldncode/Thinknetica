require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity, :occupied_capacity

  def initialize(capacity)
    @type = 'cargo'
    super('cargo', capacity)
  end
end
