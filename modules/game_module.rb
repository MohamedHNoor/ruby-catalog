require_relative '../classes/game'
require 'json'
require 'date'

module GameModule
  def load_game
    file = './json_db/games.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data << Game.new(element['publish_date'], element['multiplayer'], element['last_played'])
      end
    end
    data
  end

  def save_game
    data = []
    directory = './json_db/games.json'
    File.new(directory, 'w') unless File.exist?(directory)
    @games.each do |game|
      data.push({ 'publish_date' => game.publish_date, 'multiplayer' => game.multiplayer,
                  'last_played_at' => game.last_played_at })
    end
    File.open(directory, 'w') do |file|
      file.puts(JSON.pretty_generate(data))
    end
  end
end
