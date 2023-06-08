require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'books_ui'
require_relative 'music_ui'
require 'json'

class App
  attr_accessor :books, :labels

  def initialize
    @books = BooksUI.new
    @music_ui = MusicUI.new
    @music_ui.populate_music_album_genre
  end

  def save_data
    @books.save_books
    @books.save_labels
    @music_ui.preserve_music_album_genre
  end

  def load_data
    @books.load_books
    @books.load_labels
  end

  def display_menu(app)
    loop do
      puts "Welcome to books part! \nChoose an option:"
      puts '1. List all books'
      puts '2. List all labels'
      puts '3. Add a book'
      puts '4. Quit'
      choice = gets.chomp.to_i

      case choice
      when 1
        books.list_all_books
      when 2
        books.list_all_labels
      when 3
        books.add_book
      when 4
        save_data
        app_options(app)
        return
      end
    end
  end

  def music_display_menu
    loop do
      puts "Welcome to the music part!"
      puts "Choose an option:"
      puts "1. List all music albums"
      puts "2. List all genres"
      puts "3. Add a music album"
      puts "4. Quit"

      choice = gets.chomp.to_i

      case choice
      when 1
        @music_ui.list_music_albums
      when 2
        @music_ui.list_genres
      when 3
        @music_ui.loop_create_music_album
      when 4
        save_data
        return
      end
    end
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
