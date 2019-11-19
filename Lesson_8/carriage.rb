# frozen_string_literal: true

require_relative 'company'

class Carriage
  include Producer

  attr_reader :type, :producer, :capacity, :occupied_capacity

  def initialize(type, capacity)
    @type = type
    @capacity = capacity
    @occupied_capacity = 0
  end

  def free_capacity
    @capacity - @occupied_capacity
  end

  def occupy_capacity(volume)
    @occupied_capacity += volume if free_capacity >= volume
  end
end
