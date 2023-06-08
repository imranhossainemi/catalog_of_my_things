require_relative 'book'
require 'json'
require_relative 'label'

class BooksUI
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Please enter Publisher Name:'
    publisher = gets.chomp
    puts 'Please enter the Cover State (good or bad)'
    cover_state = gets.chomp
    puts 'Enter Publish date in year-month-date(2020-05-23) format'
    publish_date = gets.chomp
    puts 'Please enter Label Title:'
    title = gets.chomp
    puts 'Please enter the Label Color'
    color = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    @books.push(book)
    label = Label.new(title, color)
    @labels.push(label)
    puts 'Book Created Successfully'
  end

  def list_all_books
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Cover State: #{book.cover_state}"
    end
  end

  def save_books
    books = @books.each_with_index.map do |book, index|
      {
        publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state, index: index
      }
    end
    File.write('./data/books.json', JSON.generate(books))
  end

  def load_books
    return [] unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    read_file = File.read(file)
    json = JSON.parse(read_file)

    loaded_books = []
    json.each do |book|
      loaded_books << Book.new(book['publish_date'], book['publisher'], book['cover_state'])
    end
    file.close
    @books = loaded_books
  end

  def list_all_labels
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end

  def save_labels
    labels = @labels.each_with_index.map do |label, index|
      {
        index: index, title: label.title, color: label.color
      }
    end
    File.write('./data/labels.json', JSON.generate(labels))
  end

  def load_labels
    return [] unless File.exist?('./data/labels.json')

    file = File.open('./data/labels.json')
    read_file = File.read(file)
    json = JSON.parse(read_file)

    loaded_labels = []
    json.each do |label|
      loaded_labels << Label.new(label['title'], label['color'])
    end
    file.close
    @labels = loaded_labels
  end
end
