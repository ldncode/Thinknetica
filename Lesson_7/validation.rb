module Validation
  def valid?
    validate!
    true
  rescue
    false
  end
end
