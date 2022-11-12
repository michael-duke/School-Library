require_relative '../nameable'
require_relative '../person'

describe Nameable do
  before :each do
    @person = Person.new(39, name: 'Obi Wan Kenobi')
    @nameable = Nameable.new
  end

  context 'When creating a Nameable instance' do
    it 'can correct_name' do
      expect(@nameable).to respond_to(:correct_name)
    end
    it 'should raise NotImplementedError' do
      expect do
        @nameable.correct_name
      end.to raise_error('Nameable has not implemented method \'correct_name\'', NotImplementedError)
    end
  end

  context 'When calling correct_name on Person instance' do
    it 'should not raise error an error since it\'s implemented' do
      expect do
        @person.correct_name
      end.not_to raise_error
    end
    it 'should retrun the name attribute correctly' do
      expect(@person.correct_name).to match 'Obi Wan Kenobi'
    end
  end
end
