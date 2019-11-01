require_relative 'main'
require_relative 'train'

class Carriages
  attr_reader :type

  def initialize(type)
    @type = type
  end
end
