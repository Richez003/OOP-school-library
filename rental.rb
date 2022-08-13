class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initiallize(date, book, _peson)
    @date = date

    @book = book
    person.rentals << self

    @person = person
    book.rentals << self
  end
end
