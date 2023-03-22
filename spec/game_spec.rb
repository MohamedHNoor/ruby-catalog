require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  let(:game) { Game.new('2012-12-12', true, '2019-01-01') }

  describe '#initialize' do
    it 'should initialize a game' do
      expect(game).to be_a(Game)
    end

    it 'game publish date should be 1990-01-01' do
      expect(game.publish_date).to eq('2012-12-12')
    end

    it 'game multiplayer should be true' do
      expect(game.multiplayer).to eq(true)
    end

    it 'game last played at should be 2019-01-01' do
      expect(game.last_played_at).to eq('2019-01-01')
    end
  end

  describe '#can_be_archived?' do
    it 'should return false' do
      expect(game.archived).to eq(false)
    end

    it 'should return true' do
      game.move_to_archive
      expect(game.archived).to eq(true)
    end
  end
end
