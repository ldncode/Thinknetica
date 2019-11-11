require_relative 'carriages'

class PassengerCarriages < Carriages
  attr_reader :places, :overall

  def initialize(places)
    @type = 'passenger'
    @places = places
  end
end
