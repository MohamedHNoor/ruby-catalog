class Label
  attr_accessor :title, :items, :id, :color

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.lable = self
  end
end
