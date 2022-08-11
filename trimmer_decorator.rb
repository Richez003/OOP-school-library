require './base_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.substring!(0, 10)
  end
end
