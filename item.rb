require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id = Random.rand(1..1000),publish_date)
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    begin
      publish_date = Date.parse(@publish_date)
    rescue StandardError
      publish_date = nil
    end
    if publish_date.nil?
      false
    else
      (Date.today.year - publish_date.year) > 10
    end
  end
end
