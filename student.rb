require './person'

class Student < person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission)
  end
play_hooky
  def play_hooky
    "¯\(ツ)/¯"
  end
end
