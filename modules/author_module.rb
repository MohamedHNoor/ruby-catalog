require_relative '../classes/author'
require 'json'
require 'date'

module AuthorModule
  def load_author
    file = './json_db/authors.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |author|
        data << Author.new(author['id'], author['first_name'], author['last_name'])
      end
    end
    data
  end

  def save_author
    data = []
    direcotry = './json_db/authors.json'
    File.new(direcotry, 'w') unless File.exist?(direcotry)
    @authors.each do |author|
      data << { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
    File.open(direcotry, 'w') do |file|
      file.puts(JSON.pretty_generate(data))
    end
  end
end
