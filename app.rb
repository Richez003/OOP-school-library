require './student'
require './teacher'
require './person'
require './book'
require './rental'

class App
  def initiallize
    @book_list = []
    @person_list = []
    @rental_list = []
  end

  def list_book
    if @book_list.empty?
      put 'There are no books listed!'
    else
      @book_list.collect { |books| put "Title: #{books.title}, Author: #{books.author}" }
    end
  end

  def list_person
    if @person_list.empty?
      put 'There are no people listed!'
    else
      @person_list.collect { |persons| put "Name: #{persons.name}, Id: #{persons.id}, Age: #{persons.age}" }
    end
  end

  def create_person
    put 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    value = gets.chomp.to_i

    case value
    when 1
      create_student
    when 2
      create_teacher
    else
      put 'Please enter a valid number between 1 or 2!'
    end
  end

  def create_student
    p 'Name: '
    name = gets.chomp
    p 'Age: '
    age = gets.chomp.to_i
    p 'has parent permission [Y/N]: '
    parent_permission = gets.chomp.uppercase
    student = Student.new(age, name, parent_permission)
    @person_list << student
    put ' created successfully!'
  end

  def create_teacher
    p 'Name: '
    name = gets.chomp
    p 'Age: '
    age = gets.chomp.to_i
    p 'Specialization'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, Specialization)
    @person << teacher
    put ' created successfully!'
  end

  def create_book
    p 'Author: '
    author = gets.chomp
    p 'Title: '
    title = gets.chomp
    book = Book.new(author, title)
    @person_list << book
    put ' created successfully!'
  end

  def create_rental
    if @book_list.empty?
      put 'There are no books listed! please add book'
      @book_list.collect { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    else
      puts 'Please select a person from the following list by number '
      @people.collect { |person| puts "Name: #{person.name}, Age: #{person.age}" }
      puts 'Date: '
      date = gets.chomp.to_s
      rental = Rental.new(date, @book_list[book], @people_list[person])
      @rental_list << rental
      put 'rental created sucessfully'
    end
  end

  def rentals_by_person_id
    if @rental_list.empty?
      puts 'No rentals by this person yet.'
    else
      p 'person ID: '
      id = gets.chomp.to_i
      p 'Rentals:'
      @rental_list.sort { |rental| rental.person.id == id }
      puts "Date: #{rental[0].date}, Book: #{rental[0].book.title} Author: #{rental[0].book.author}"
    end
  end
end
