require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'

s1 = Student.new('A-Class', 21, 'Zack')
s2 = Student.new('Z-Class', 25, 'Ned')
class_a = Classroom.new('A-Class')

p s1.classroom # => 'A-Class'
p class_a.students.count # => 0

s1.classroom = class_a
p class_a.students.count # => 1

class_a.add_student(s2)
p class_a.students.count # => 2
p s2.classroom.label # => 'A-Class'

book1 = Book.new('The Lord of the Rings', 'Tolkien')
r1 = Rental.new(Time.now, s1, book1)

p r1.book.title, # => The Lord of the Rings
  r1.person.name # => Zack

p book1.rentals.count # => 1
p s1.rentals.count # => 1
