require 'json'
require 'fileutils'

class SaveData
  def self.create_file(path, array)
    FileUtils.mkdir_p('./data')
    FileUtils.touch(path) unless File.exist?(path)
    File.write(path, JSON.pretty_generate(array))
  end

  def self.save_people(people)
    people_array = []
    people.each do |person|
      person_obj = {
        id: person.id,
        name: person.name,
        age: person.age,
        has_permission: person.parent_permission,
        type: person.type
      }
      if person.type == 'Student'
        person_obj[:classroom] = person.classroom
      else
        person_obj[:specialization] = person.specialization
      end
      people_array << person_obj
    end
    return if people_array.empty?

    create_file('./data/people.json', people_array)
  end

  def self.save_books(books)
    books_array = []
    books.each do |book|
      books_array << { title: book.title, author: book.author }
    end
    return if books_array.empty?

    create_file('./data/books.json', books_array)
  end

  def self.save_rentals(rentals)
    rentals_array = []
    rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        title: rental.book.title, author: rental.book.author,
        id: rental.person.id, name: rental.person.name, age: rental.person.age,
        has_permission: rental.person.parent_permission,
        type: rental.person.type
      }
      if rental.person.type == 'Student'
        rental_obj[:classroom] = rental.person.classroom
      else
        rental_obj[:specialization] = rental.person.specialization
      end
      rentals_array << rental_obj
    end
    return if rentals_array.empty?

    create_file('./data/rentals.json', rentals_array)
  end
end
