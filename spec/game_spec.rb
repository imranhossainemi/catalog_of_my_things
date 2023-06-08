require_relative '../game.rb'
require_relative '../author.rb'


describe Game do
  let(:authors) { [Author.new('John', 'Doe')] }

  describe '#initialize' do
    it 'creates a new game with the provided attributes' do
      game = Game.new('Title', true, '2023/01/01', '2022/01/01', authors)

      expect(game.title).to eq('Title')
      expect(game.multiplayer).to be_truthy
      expect(game.last_played_at).to eq('2023/01/01')
      expect(game.publish_date).to eq('2022/01/01')
      expect(game.authors).to eq(authors)
    end
  end

  describe '#add_authors' do
    it 'adds authors to the game' do
      game = Game.new('Title', true, '2023/01/01', '2022/01/01')

      game.add_authors(authors)

      expect(game.authors).to eq(authors)
    end
  end

  describe '#add_author' do
    it 'adds a single author to the game' do
      game = Game.new('Title', true, '2023/01/01', '2022/01/01')
      author = Author.new('Jane', 'Smith')

      game.add_author(author)

      expect(game.authors).to include(author)
      expect(author.items).to include(game)
    end

    it 'does not add the same author multiple times' do
      game = Game.new('Title', true, '2023/01/01', '2022/01/01')
      author = Author.new('Jane', 'Smith')

      game.add_author(author)
      game.add_author(author)

      expect(game.authors.size).to eq(1)
      expect(author.items.size).to eq(1)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the game' do
      game = Game.new('Title', true, '2023/01/01', '2022/01/01', authors)

      hash = game.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:id]).to be_a(Integer)
      expect(hash[:title]).to eq('Title')
      expect(hash[:multiplayer]).to be_truthy
      expect(hash[:last_played_at]).to eq('2023/01/01')
      expect(hash[:publish_date]).to eq('2022/01/01')
      expect(hash[:author_ids]).to eq(authors.map(&:id))
    end
  end
end
