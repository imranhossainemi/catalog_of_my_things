require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'books_ui'
require 'json'

class App
  attr_accessor :books, :labels

  def initialize
    @books = BooksUI.new
  end

  def save_data
    @books.save_books
    @books.save_labels
  end

  def load_data
    @books.load_books
    @books.load_labels
  end

  
  private

  def load_json_data(file_name, class_type)
    if File.exist?(file_name)
      json_data = File.read(file_name)
      items = JSON.parse(json_data).map { |item_json| class_type.from_json(JSON.generate(item_json)) }
      items.compact
    else
      []
    end
  end

  def save_json_data(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end
end
