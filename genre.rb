class Genre
  attr_reader :name, :items, :id

  def initialize(name, id = rand(1..10_000))
    @id = id
    @items = []
    @name = name
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_genre(self) unless item.genre == self
  end
end
