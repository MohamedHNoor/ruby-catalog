require_relative '../classes/genre'
require 'json'
require 'date'

module GenreData
  def load_genre
    file = './json_db/genre.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data.push(Genre.new(element['id'].to_i, element['name']))
      end
    end
    data
  end

  def save_genre
    data = []
    @genres.each do |genre|
      data.push({ id: genre.id, name: genre.name})
    end
    File.write('./json_db/genre.json', JSON.pretty_generate(data))
  end

  def create_genre(items)
    puts "Enter genre name:"
    name = gets.chomp
    genre = Genre.new(@genres.length + 1, name)
    genre.add_item(items)
    @genres << genre
    save_genre
  end
end