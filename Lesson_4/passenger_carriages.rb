class PassengerCarriages < Carriages
  attr_reader :places
  def initialize(places)
    @type = 'passenger'
    @places = places
  end
end
