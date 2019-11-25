require_relative 'accessors'

class Example
  include Accessors

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :a, Integer

end
