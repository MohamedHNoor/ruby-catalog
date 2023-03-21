require_relative '../classes/label'
require 'json'
require 'date'

module LabelsData
  def load_labels
    file = './json_db/labels.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
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
    File.write('./json_db/labels.json', JSON.generate(data))
  end
end