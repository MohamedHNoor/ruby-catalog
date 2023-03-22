require_relative '../classes/musicalbum'
require_relative '../classes/item'

describe MusicAlbum do
  musicalbum = MusicAlbum.new('2012-12-12', true)

  describe '#initialize' do
    it 'should initialize a MusicAlbum' do
      expect(musicalbum).to be_a(MusicAlbum)
    end

    it 'MusicAlbum publish date should be 2012-12-12' do
      expect(musicalbum.publish_date).to eq('2012-12-12')
    end

    it 'MusicAlbum on_spotify should be true' do
      expect(musicalbum.on_spotify).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    it 'should return false' do
      expect(musicalbum.archived).to eq(false)
    end

    it 'should return true' do
      musicalbum.move_to_archive
      expect(musicalbum.archived).to eq(true)
    end
  end
end
