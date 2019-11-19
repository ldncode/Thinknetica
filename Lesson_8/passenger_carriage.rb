# frozen_string_literal: true

require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :capacity, :occupied_capacity

  def initialize(capacity)
    @type = 'passenger'
    super('passenger', capacity)
  end

  def occupy_capacity
    super(1)
  end
end
