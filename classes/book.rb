class Book < Item
  attr_accessor :publisher, :cover_state, :name

  def initialize(name, publisher, cover_state, publish_date)
    super(name, publish_date)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end
end