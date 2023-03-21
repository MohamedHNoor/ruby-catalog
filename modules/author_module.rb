require_relative '../classes/author'
require 'json'
require 'date'

class AuthorModule
  def load_author
    file = File.read('./json_db/authors.json')
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['id'].to_i, author['first_name'], author['last_name']))
      end
    end
    data
  end

  def save_author
    data = []
    @authors.each do |author|
      data.push({ id: author.id, first_name: author.first_name, last_name: author.last_name })
    end
    File.write('./json_db/authors.json', JSON.pretty_generate(data))
  end
end
