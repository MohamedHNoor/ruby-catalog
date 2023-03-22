require_relative '../classes/musicalbum'
require 'json'
require 'date'

module MusicAlbumData
  def load_album
    data = []
    file = './json_db/musicalbum.json'
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data << MusicAlbum.new(element['publish_date'], element['on_spotify'])
      end
    end
    data
  end

  def save_album
    directory = './json_db/musicalbum.json'
    data = []
    File.new(directory, 'w') unless File.exist?(directory)
    @albums.each do |album|
      data.push({publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.open(directory, 'w') do |file|
      file.puts(JSON.pretty_generate(data))
    end
  end
end