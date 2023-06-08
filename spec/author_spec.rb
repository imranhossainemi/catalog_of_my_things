require_relative '../author'
require_relative '../game'

describe Author do
  describe '#initialize' do
    it 'creates a new author with the provided attributes' do
      author = Author.new('Ikoote', 'Rasuli')

      expect(author.first_name).to eq('Ikoote')
      expect(author.last_name).to eq('Rasuli')
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      author = Author.new('Ikoote', 'Rasuli')
      game = Game.new('Title', true, '2023/01/01', '2022/01/01')

      author.add_item(game)

      expect(author.items).to include(game)
      expect(game.authors).to include(author)
    end

    it 'does not add the same item multiple times' do
      author = Author.new('Ikoote', 'Rasuli')
      game = Game.new('Title', true, '2023/01/01', '2022/01/01')

      author.add_item(game)
      author.add_item(game)

      expect(author.items.size).to eq(1)
      expect(game.authors.size).to eq(1)
    end
  end

  describe '#full_name' do
    it 'returns the full name of the author' do
      author = Author.new('Ikoote', 'Rasuli')

      expect(author.full_name).to eq('Ikoote Rasuli')
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the author' do
      author = Author.new('Ikoote', 'Rasuli')

      hash = author.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:id]).to be_a(Integer)
      expect(hash[:first_name]).to eq('Ikoote')
      expect(hash[:last_name]).to eq('Rasuli')
      expect(hash[:items]).to eq([])
    end
  end
end
