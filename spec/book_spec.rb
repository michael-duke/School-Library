require './book'
require './rental'
require './person'

describe Book do
  before :each do
    @book1 = Book.new('Game of Thrones', 'George Martin')
    @book2 = Book.new('The Songs of Achilles', 'Madelaine Miller')
    @person = Person.new(39, name: 'Obi Wan Kenobi')
  end

  context 'When creating a new Book' do
    it 'should have the following attributes (title, author, and rentals)' do
      expect(@book1.title).to eql 'Game of Thrones'
      expect(@book1.author).to eql 'George Martin'
      expect(@book1.rentals.count).to eq(0)
    end
    it 'should be an instance of the class Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
    end
  end

  context 'When adding a rental for a Book' do
    it 'can add a rental' do
      expect(@book1).to respond_to(:add_rental)
    end
    it 'has it\'s rentals array length increased' do
      expect(@book1.rentals.count).to eq(0)
      Rental.new(Time.now, @person, @book1)
      expect(@book1.rentals.count).to eq(1)
    end
    it 'can add a new rental with add_rental method' do
      expect(@book2.rentals.count).to eq(0)
      rental = Rental.new(Time.now, @person, @book1)
      @book2.add_rental(rental)
      expect(@book2.rentals.count).to eq(1)
    end
  end
end
