require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) > 2
  end

  private :can_be_archived?
end
