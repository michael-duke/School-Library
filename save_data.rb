require 'json'
require 'fileutils'

class SaveData
  def check_file_exists(filename)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    FileUtils.touch('./data/people.json') if !File.exist?('./data/people.json') && filename == 'people'
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/rentals.json') if !File.exist?('./data/rentals.json') && filename == 'rentals'
  end

  def save_people(people)
    people_array = []
    people.each do |person|
      person_obj = { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission,
                     type: person.type }
      if person.type == 'Student'
        person_obj[:classroom] = person.classroom
      else
        person_obj[:specialization] = person.specialization
      end
      people_array << person_obj
    end
    p people_array

    unless people_array.empty?
      check_file_exists('people')
      File.write('./data/people.json', JSON.pretty_generate(people_array))
    end
  end

  def save_books(books)
    books_array = []
    books.each do |book|
      books_array << { title: book.title, author: book.author }
    end
    p books_array

    unless books_array.empty?
      check_file_exists('books')
      File.write('./data/books.json', JSON.pretty_generate(books_array))
    end
  end

  def save_rentals(rentals)
    rentals_array = []
    rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        title: rental.book.title,
        author: rental.book.author,
        id: rental.person.id,
        name: rental.person.name,
        age: rental.person.age,
        parent_permission: rental.person.parent_permission,
        type: rental.person.type
      }
      if rental.person.type == 'Student'
        rental_obj[:classroom] = rental.person.classroom
      else
        rental_obj[:specialization] = rental.person.specialization
      end
      rentals_array << rental_obj
    end
    p rentals_array

    unless rentals_array.empty?
      check_file_exists('rentals')
      FileUtils.touch('./data/rentals.json') unless File.exist?('./data/rentals.json')
      File.write('./data/rentals.json', JSON.pretty_generate(rentals_array))
    end
  end
end
