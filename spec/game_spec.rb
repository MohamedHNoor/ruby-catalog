require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  let(:game) { Game.new(Time.new(1990, 0o1, 0o1), true, Time.new(2019, 0o1, 0o1)) }

  describe '#initialize' do
    it 'should initialize a game' do
      expect(game).to be_a(Game)
    end

    it 'game publish date should be 1990-01-01' do
      expect(game.publish_date).to eq(Time.new(1990, 0o1, 0o1))
    end

    it 'game multiplayer should be true' do
      expect(game.multiplayer).to eq(true)
    end

    it 'game last played at should be 2019-01-01' do
      expect(game.last_played_at).to eq(Time.new(2019, 0o1, 0o1))
    end
  end

  describe '#can_be_archived?' do
    it 'should return false' do
      game.last_played_at = Time.new(2017, 0o1, 0o1)
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
