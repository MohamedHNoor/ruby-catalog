require 'date'
class Item
  attr_accessor :archived, :publish_date, :genre, :author, :source, :label

  def initialize(publish_date, id = nil)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.to_i) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
