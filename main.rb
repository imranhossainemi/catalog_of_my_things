require_relative 'app'

def list_options
  puts 'Please select an option:'
  puts '1. List all books'
  puts '6. List all labels'
  puts '7. Add a book'
  puts '0 - Exit'
end

def options(app, choice)
  case choice
  when 1
    app.books.list_all_books
  when 6
    app.books.list_all_labels
  end
end

def options1(app, choice)
  case choice
  when 7
    app.books.add_book
  when 0
    app.save_data
    exit
  end
end

def selection(app, choice)
  options(app, choice)
  options1(app, choice)
end

def main
  app = App.new
  app.load_data
  puts 'Welcome to our App..'
  loop do
    list_options
    print 'Please select an option:'
    choice = gets.chomp.to_i
    selection(app, choice)
  end
end

main
