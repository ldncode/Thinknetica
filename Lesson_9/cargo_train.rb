# frozen_string_literal: true

require_relative 'train'

class CargoTrain < Train
  attr_reader :type

  validate :name, :format, FORMAT_NUMBER

  def initialize(number)
    super(number, 'cargo')
  end
end
