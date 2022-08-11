require './rental'
class Book
  attr_accessor :author, :title, :rental

  def initialize(author, title)
    @author = author
    @title = title
    @rental = []
  end

  def add_rental(_person, date)
    Rental.new(perason, date, self)
  end
end
