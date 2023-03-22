require_relative '../classes/book'
require 'json'
require 'date'

module BooksData
  def load_books
    data = []
    file = './json_db/books.json'
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data << Book.new(element['name'], element['publisher'], element['cover_state'], element['publish_date'])
      end
    end
    data
  end

  def save_books
    directory = './json_db/books.json'
    data = []
    File.new(directory, 'w') unless File.exist?(directory)
    @books.each do |book|
      data.push({ name: book.name, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.open(directory, 'w') do |file|
      file.puts(JSON.pretty_generate(data))
    end
  end
end
