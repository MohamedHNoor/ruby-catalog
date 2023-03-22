require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  genre = Genre.new('1', 'Harshita')
  describe '#initialize' do
    it 'should create new genre' do
      expect(genre).to be_a Genre
    end

    it 'should have name' do
      expect(genre.name).to eq('Harshita')
    end
  end

  describe '#add_item' do
    it 'should add item to genre' do
      item = Item.new(Time.new(2019, 1, 1), true)
      genre.add_item(item)
      expect(genre.items.length).to eq(1)
    end
  end
end
