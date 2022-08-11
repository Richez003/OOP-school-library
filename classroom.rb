class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_studnt(student)
    @student.map(student)
    student.Classroom = self
  end
end
