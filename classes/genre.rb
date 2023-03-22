require_relative './musicalbum'

class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) 
    item.add_genre(self)
  end
end
