require 'json'
require 'fileutils'

class SaveData  
  
  def save_people(people)
    people_array = []
    people.each do |person|
      person_obj = {id:person.id, name: person.name, age: person.age, parent_permission: person.parent_permission, type: person.type}
      if person.type == 'Student'
        person_obj[:classroom] = person.classroom
      else
        person_obj[:specialization] = person.specialization
      end
      people_array << person_obj
    end
    p people_array

    if !people_array.empty? 
      check_file_exists('people')
      File.write('./data/people.json', JSON.pretty_generate(people_array))
    end
  end
end