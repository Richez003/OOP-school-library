require './person'

class Teacher
  def initiallize(specialization, age, name = 'unkown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission)
  end

  def can_use_service?
    true
  end
end
