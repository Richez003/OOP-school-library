require './base_decorator'

class CapitalizedDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
