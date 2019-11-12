require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :places, :overall, :occupied_seats, :vacant_seats

  def initialize(places, overall)
    @type = 'passenger'
    @places = places
    @overall = overall
    @occupied_seats = 0
    @vacant_seats = @overall - @occupied_seats
  end

  def take_place
    @occupied_seats += 1
  end

end

