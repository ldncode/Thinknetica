require_relative 'company'
require_relative 'validation'


class Carriage
  include Producer
  include Validation

  attr_reader :type, :producer, :overall

  def initialize(type, producer, overall)
    @type = type
    @producer = producer
    validate!
    @overall = overall
  end

  private

  def validate!
      raise ArgumentError, 'Введите точное название производителя' unless producer.empty?
      raise ArgumentError, 'Введите тип вагона' unless types.include?(type)
  end
end
