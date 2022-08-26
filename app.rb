require './student'
require './teacher'
require './person'
require './book'
require './rental'

class App
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def list_books
    if @book_list.empty?
      puts 'Book List is empty.'
    else
      puts 'Book List: '
      @book_list.each do |book|
        puts "Title: '#{book.title}', Author: '#{book.author}'"
      end
    end
  end

  def list_people
    if @people_list.empty?
      puts 'People List is empty.'
    else
      puts 'People List: '
      @people_list.each do |person|
        puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or teacher(2)? [Input the number]: '
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Choose a valid option number that is from (1 or 2)'
    end
  end

  def create_student
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts "Have Parent's Permission [Y/N]: "
    permission = gets.chomp
    student = Student.new(name, age, permission)
    @people_list.push(student)
    puts 'Person created successfully!'
  end

  def create_teacher
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people_list.push(teacher)
    puts 'Person created successfully!'
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book_list.push(book)
    puts 'Book created successfully!'
  end

  def create_rental
    if @book_list.empty?
      puts 'Books list is empty, please add a book first.'
    elsif @people_list.empty?
      puts 'People list is empty, please add a person first.'
    else
      select_book
      book = gets.chomp.to_i
      select_person
      person = gets.chomp.to_i
      puts 'Date: '
      date = gets.chomp
      rental = Rental.new(date, @book_list[book], @people_list[person])
      @rentals.push(rental)
      puts 'Rental created successfully.'
    end
  end

  def select_book
    puts 'Select a book from the list by number(not ID): '
    @book_list.each_with_index do |book, index|
      puts " #{index} Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def select_person
    puts 'Select a person from the list by number(not ID): '
    @people_list.each_with_index do |person, index|
      puts " #{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    if @rental_list.empty?
      puts 'No rentals by this person yet.'
    else
      id = gets.chomp.to_i
      puts 'Rentals: '
      rented = @rental_list.select { |rental| rental.person.id == id }
      puts "Date: #{rented[0].date}, Book: #{rented[0].book.title}, Author: #{rented[0].book.author}"
    end
  end
end
