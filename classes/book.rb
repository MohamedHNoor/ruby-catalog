require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :name

  def initialize(name, publisher, cover_state, publish_date)
    super(publish_date)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
