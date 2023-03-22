require 'date'
require_relative '../classes/book'

describe Book do
  before(:each) do
    @book_item = Book.new('Harry Potter', 'JK Rowlings', 'good', '2018-05-12')
  end
  context 'Book class' do
    it 'A newly created book has a title of type String' do
      expect(@book_item.name).not_to be_nil
      expect(@book_item.name).to be_a(String)
    end

    it ' detect the book title' do
      expect(@book_item.name).to eq 'Harry Potter'
    end

    it ' detect the book publisher' do
      expect(@book_item.publisher).to eq 'JK Rowlings'
    end

    it ' detect the book cover_state' do
      expect(@book_item.cover_state).to eq 'good'
    end

    it 'detect the book publish_date' do
      expect(Date.parse(@book_item.publish_date)).to eq Date.parse('2018-05-12')
    end

    it 'detect the book archive state' do
      expect(@book_item.archived).to be false
    end

    it 'move the book to archived' do
      @book_item.cover_state = 'bad'
      @book_item.move_to_archive
      expect(@book_item.archived).to be true
    end
  end
end
