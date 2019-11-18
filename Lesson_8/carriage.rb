require_relative 'company'
require_relative 'validation'


class Carriage
  include Producer
  include Validation

  attr_reader :type, :producer, :capacity

  def initialize(type, capacity)
    @type = type
    validate!
    @capacity = capacity
    @occupied_capacity = 0
  end

  def free_capacity
    @capacity - @occupied_capacity
  end

  def occupy_capacity(volume)
    @occupied_capacity += volume if free_capacity >= volume
  end

  private

  def validate!
      raise ArgumentError, 'Введите точное название производителя' unless producer.empty?
      raise ArgumentError, 'Введите тип вагона' unless types.include?(type)
  end
end
