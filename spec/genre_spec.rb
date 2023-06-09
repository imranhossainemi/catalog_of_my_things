require 'rspec'
require_relative '../genre'

RSpec.describe Genre do
  let(:genre_name) { 'Test Genre' }
  let(:genre_id) { 1 }
  let(:genre) { described_class.new(genre_name, genre_id) }

  describe '#initialize' do
    it 'initializes a new Genre object with the given parameters' do
      expect(genre).to be_a(Genre)
      expect(genre.name).to eq(genre_name)
      expect(genre.id).to eq(genre_id)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item', add_genre: nil, genre: nil) }

    it 'adds the item to the genre if it is not already present' do
      expect(genre.items).to be_empty
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'does not add the item to the genre if it is already present' do
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(genre.items.size).to eq(1)
      genre.add_item(item)
      expect(genre.items.size).to eq(1)
    end

    it 'calls #add_genre on the item with the genre as an argument if the item does not have this genre' do
      expect(item).to receive(:add_genre).with(genre)
      genre.add_item(item)
    end

    it 'does not call #add_genre on the item if the item already has this genre' do
      allow(item).to receive(:genre).and_return(genre)
      expect(item).not_to receive(:add_genre)
      genre.add_item(item)
    end
  end
end
