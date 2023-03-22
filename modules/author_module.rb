require_relative '../classes/author'
require 'json'
require 'date'

module AuthorModule
  def create_author(items)
    puts 'Enter author first name:'
    first_name = gets.chomp
    puts 'Enter author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name, @authors.length + 1)
    author.add_item(items)
    @authors << author
    save_author
  end

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
