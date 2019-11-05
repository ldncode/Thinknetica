require_relative 'main'
require_relative 'train'
require_relative 'company'

class Carriages
  include Producer

  attr_reader :type

  def initialize(type)
    @type = type
  end
end
