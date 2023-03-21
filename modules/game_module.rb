require_relative '../classes/game'
require 'json'
require 'date'

module GameModule
  def load_game
    file = './json_db/games.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data.push(Game.new(element['publish_date'], element['archived'], element['multiplayer'],
                           element['last_played']))
      end
    end
    data
  end

  def save_game
    data = []
    @games.each do |game|
      data.push({ publish_date: game.publish_date, archived: game.archived, multiplayer: game.multiplayer,
                  last_played: game.last_played })
    end
    File.write('./json_db/games.json', JSON.generate(data))
  end
end
