require_relative 'app'
require_relative 'game_ui'
require_relative 'music_ui'

def app_options(app)
  puts 'Please select an option:'
  puts '1. option for books'
  puts '2. Option for music'
  puts '3. Option for games'
  puts '0 - Exit'

  print 'Please select an option:'
  choice = gets.chomp.to_i

  case choice
  when 1
    app.display_menu(app)
  when 2
    app.music_display_menu
  when 3
    store = Store.new
    store.display_menu(app)
    store.music_display_menu
  when 0
    exit
  end
end

def main
  app = App.new
  app.load_data
  puts 'Welcome to our App..'
  loop do
    app_options(app)
    # selection(app, choice)
  end
end

main
