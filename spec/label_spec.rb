require 'date'
require_relative '../classes/label'

describe Label do
  before :each do
    @label_item = Label.new(22, 'TEST LABEL NAME', 'RED')
  end
  context 'Label class' do
    it 'A newly created Label has a title of type String' do
      expect(@label_item.title).not_to be_nil
      expect(@label_item.title).to be_a(String)
    end

    it ' detect the Label color' do
      expect(@label_item.color).to eq 'RED'
    end

    it ' detect the Label id' do
      expect(@label_item.id).to eq 22
    end

    it ' detect the Label name' do
      expect(@label_item.title).to eq 'TEST LABEL NAME'
    end
  end
end
