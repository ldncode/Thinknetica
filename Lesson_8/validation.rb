# frozen_string_literal: true

module Validation
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
