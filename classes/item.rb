require 'date'
class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :archived

  def initialize(publish_date, id = nil)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    today = Date.today
    ten_years_ago = Date.new(today.year - 10, today.month, today.day)
    Date.parse(@publish_date) < ten_years_ago
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
