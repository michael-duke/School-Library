require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(22, name: 'maximilianus')
    @capitalized_name = CapitalizeDecorator.new(@person)
    @trimmed_name = TrimmerDecorator.new(@person)
  end

  context 'When using the correct_name method from the CapitalizeDecorator class' do
    it 'can use correct_name' do
      expect(@capitalized_name).to respond_to(:correct_name)
    end
    it 'should return the name in capitalized' do
      expect(@capitalized_name.correct_name).to eql 'Maximilianus'
    end
  end

  context 'When using the correct_name method from the TrimmerDecorator class' do
    it 'can use correct_name' do
      expect(@trimmed_name).to respond_to(:correct_name)
    end
    it 'should trim the name if it is longer than 10 characters' do
      expect(@trimmed_name.correct_name).to eql 'maximilian'
    end
    it 'should have length of 10' do
      expect(@trimmed_name.correct_name.length).to eq 10
    end
  end
end
