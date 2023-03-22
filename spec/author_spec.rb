require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  author = Author.new('John', 'Doe')
  describe '#initialize' do
    it 'should create new author' do
      expect(author).to be_a Author
    end

    it 'should have first name' do
      expect(author.first_name).to eq('John')
    end

    it 'should have last name' do
      expect(author.last_name).to eq('Doe')
    end
  end

  describe '#add_item' do
    it 'should add item to author' do
      item = Item.new(Time.new(2019, 1, 1), true)
      author.add_item(item)
      expect(author.items.length).to eq(1)
    end
  end
end
