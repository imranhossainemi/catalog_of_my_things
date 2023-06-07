require_relative 'app'
require_relative 'game_ui'

def app_options
  puts 'Please select an option:'
  puts '1. option for books'
  puts '2. Option for music'
  puts '3. Option for games'
  puts '0 - Exit'
  
  print 'Please select an option:'
    choice = gets.chomp.to_i

  case choice
  when 1
    app = App.new
    app.display_menu
  when 2
    music.display_menu
  when 3
    store = Store.new
    store.display_menu
  when 0
    exit
  end
end


def main
  app = App.new
  app.load_data
  puts 'Welcome to our App..'
  loop do
    app_options
    # selection(app, choice)
  end
end

main