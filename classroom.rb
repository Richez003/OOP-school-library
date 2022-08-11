class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @student = []
  end

  def add_studnt(student)
    @student.push?(student)
    student.Classroom = self
  end
end
