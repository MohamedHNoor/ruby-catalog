class Item
    attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, :genre, author, source, label, publish_date, archived)
    @id = Random.rand(1..1000)
    @genre = genre
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end
end