require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initiallize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  private

  def of_age?
    (age >= 18)
  end

  public

  def can_use_services?
    (is_of_age? || parent_permission)
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(book, date, self)
  end
end
