require_relative '../classes/label'
require 'json'
require 'date'

module LabelsData
  def load_labels
    file = './json_db/labels.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['id'].to_i, element['title'], element['color']))
      end
    end
    data
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('./json_db/labels.json', JSON.pretty_generate(data))
  end

  def create_label(string, item)
    puts "Enter #{string}'s label title:"
    title = gets.chomp
    puts "Enter #{string}'s label color:"
    color = gets.chomp
    label = Label.new(@labels.length + 1, title, color)
    label.add_item(item)
    @labels << label
  end
end
