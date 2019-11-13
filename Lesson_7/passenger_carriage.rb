require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :places, :occupied_seats

  def initialize(places)
    @type = 'passenger'
    @places = places
    @occupied_seats = 0
  end

  def vacant_seats
    @places - @occupied_seats
  end

  def take_place
    @occupied_seats += 1 if vacant_seats > 0
  end

end

