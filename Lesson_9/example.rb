require_relative 'validation'

class Example
  include Validation
  validate :a, :presence
  validate  :type, String
  validate :format, /[A-Z]/

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate!
  end
end
