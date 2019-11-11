require_relative 'main'
require_relative 'train'
require_relative 'company'

class Carriages
  include Producer
  include Valididation

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
