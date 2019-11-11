module Valididation
  def valid?
    validate!
    true
  rescue
    false
  end
end
