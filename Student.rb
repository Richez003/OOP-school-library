require './person'

class Student
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
  end

  play hooky
  def play_hooky
    ("¯\(ツ)/¯")
  end
end
