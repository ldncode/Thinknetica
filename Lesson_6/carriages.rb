require_relative 'main'
require_relative 'train'
require_relative 'company'

class Carriages
  include Producer

  attr_reader :type, :producer

  def initialize(type, producer)
    @type = type
    @producer = producer
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
      raise ArgumentError, 'Введите точное название производителя' unless producer.empty?
      raise ArgumentError, 'Введите тип вагона' unless types.include?(type)
  end
end
